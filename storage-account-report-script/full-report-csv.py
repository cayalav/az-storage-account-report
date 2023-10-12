import json
import subprocess
import pandas as pd
from datetime import datetime
import os

def execute_az_command(command):
    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    if result.returncode == 0:
        return json.loads(result.stdout.decode())
    else:
        return None

def generate_subscription_and_resources():
    subscriptions_cmd = "az account list --output json"
    subscriptions_output = subprocess.check_output(subscriptions_cmd, shell=True, text=True)
    subscriptions = json.loads(subscriptions_output)

    subscription_and_resources = {}

    for sub in subscriptions:
        subscription_id = sub.get("id")
        subscription_name = sub.get("name")

        if not subscription_id:
            print("WARNING: Subscription ID not found. Skipping.")
            continue

        print(f"Processing subscription: {subscription_name} (ID: {subscription_id})")

        resource_groups_cmd = f"az group list --subscription {subscription_id} --output json"
        resource_groups_output = subprocess.check_output(resource_groups_cmd, shell=True, text=True)

        try:
            resource_groups = json.loads(resource_groups_output)
        except json.JSONDecodeError:
            print(f"WARNING: Failed to retrieve resource groups for subscription: {subscription_name} (ID: {subscription_id})")
            continue

        resource_group_names = [rg.get("name") for rg in resource_groups]

        subscription_and_resources[subscription_name] = []

        for resource_group_name in resource_group_names:
            storage_accounts = get_storage_accounts(subscription_id, resource_group_name)
            subscription_and_resources[subscription_name].extend(storage_accounts)

    return subscription_and_resources

def get_storage_accounts(subscription_id, resource_group_name):
    storage_cmd = f"az storage account list --subscription {subscription_id} --resource-group {resource_group_name} --output json"
    storage_output = subprocess.check_output(storage_cmd, shell=True, text=True)
    storage_accounts = json.loads(storage_output)
    return [f"subscriptions/{subscription_id}/resourceGroups/{resource_group_name}/providers/Microsoft.Storage/storageAccounts/{account['name']}" for account in storage_accounts]

def get_role_assignment_and_definition(resource_url):
    resource_url = resource_url.replace('management.azure.com', 'management.azure.com/')

    ra_command = f'az rest --method get --header "Accept=application/json" -u "https://management.azure.com/{resource_url}/providers/Microsoft.Authorization/roleAssignments?api-version=2020-10-01-preview"'
    role_assignments = execute_az_command(ra_command)

    rd_command = f'az role definition list --scope "{resource_url}" --output json'
    role_definitions = execute_az_command(rd_command)

    return role_assignments, role_definitions

def get_user_group_service_details(principal_id, principal_type):
    command = None
    if principal_type == "User":
        command = f'az ad {principal_type.lower()} show --id {principal_id} --output json'
    elif principal_type == "Group":
        command = f'az ad {principal_type.lower()} show --group {principal_id} --output json'
    elif principal_type == "ServicePrincipal":
        command = f'az ad sp show --id {principal_id} --output json'

    if command:
        details = execute_az_command(command)
        return details.get('displayName') if details else None, principal_type
    else:
        return None

def generate_report_csv(subscription_and_resources):
    timestamp = datetime.today().strftime('%Y-%m-%d')
    report_directory = './storage-account-csv-report'
    os.makedirs(report_directory, exist_ok=True)

    for subscription, storage_accounts in subscription_and_resources.items():
        if not storage_accounts:
            continue

        for storage_account_url in storage_accounts:
            storage_account_name = storage_account_url.split('/')[-1]

            role_assignments, role_definitions = get_role_assignment_and_definition(storage_account_url)

            if role_assignments and role_definitions:
                data = {'Access Control IAM Name': [], 'Principal Type': [], 'Role': [], 'Description': []}

                for ra in role_assignments.get('value', []):
                    principal_id = ra.get('properties', {}).get('principalId')
                    principal_type = ra.get('properties', {}).get('principalType')
                    role_definition_id = ra.get('properties', {}).get('roleDefinitionId')

                    role_definition = next((rd for rd in role_definitions if rd['name'] == role_definition_id.split("/")[-1]), None)

                    if role_definition:
                        role_name = role_definition.get('roleName', '')
                        role_description = role_definition.get('description', '')

                        principal_details, principal_type = get_user_group_service_details(principal_id, principal_type)
                        if principal_details:
                            data['Access Control IAM Name'].append(principal_details)
                            data['Principal Type'].append(principal_type)
                            data['Role'].append(role_name)
                            data['Description'].append(role_description)
                        else:
                            data['Access Control IAM Name'].append(f"{principal_type} - {principal_id}")
                            data['Principal Type'].append("Others")
                            data['Role'].append(role_name)
                            data['Description'].append(role_description)

                df = pd.DataFrame(data)

                csv_filename = f"{report_directory}/{storage_account_name}_{timestamp}.csv"
                df.to_csv(csv_filename, index=False)
                print(f"CSV file exported: {csv_filename}")

if __name__ == "__main__":
    subscription_and_resources = generate_subscription_and_resources()
    generate_report_csv(subscription_and_resources)
