import subprocess
import json
from datetime import datetime

def execute_az_command(command):
    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    if result.returncode == 0:
        return json.loads(result.stdout.decode())
    else:
        return None

def get_role_assignment_and_definition(resource_url):
    # Ensure there is a slash between 'management.azure.com' and 'subscriptions'
    resource_url = resource_url.replace('management.azure.com', 'management.azure.com/')

    # Role Assignment
    ra_command = f'az rest --method get --header "Accept=application/json" -u "https://management.azure.com/{resource_url}/providers/Microsoft.Authorization/roleAssignments?api-version=2020-10-01-preview"'
    role_assignments = execute_az_command(ra_command)

    # Role Definition
    rd_command = f'az role definition list --scope "{resource_url}" --output json'
    role_definitions = execute_az_command(rd_command)

    return role_assignments, role_definitions

def get_user_group_service_details(principal_id, principal_type):
    if principal_type == "User":
        command = f'az ad {principal_type.lower()} show --id {principal_id} --output json'
    elif principal_type == "Group":
        command = f'az ad {principal_type.lower()} show --group {principal_id} --output json'
    elif principal_type == "ServicePrincipal":
        command = f'az ad sp show --id {principal_id} --output json'
    else:
        return None

    details = execute_az_command(command)
    return details.get('displayName') if details else None, principal_type

def generate_report(subscription_and_resources):
    timestamp = datetime.today().strftime('%Y %m %d')
    print(f"----------------------------------------")
    print(f"| Storage accounts Report - {timestamp} |")
    print(f"----------------------------------------\n")

    for subscription, storage_accounts in subscription_and_resources.items():
        if not storage_accounts:
            continue
        
        last_storage_account_index = len(storage_accounts) - 1

        for i, storage_account_url in enumerate(storage_accounts):
            storage_account_name = storage_account_url.split('/')[-1]
            print(f"Storage Account, Subscription")
            print(f"{storage_account_name}, {subscription}")
            print("")

            role_assignments, role_definitions = get_role_assignment_and_definition(storage_account_url)

            if role_assignments and role_definitions:
                print("Access Control IAM Name, Role, Description")
                
                # Reset counts for each storage account
                user_count = group_count = sp_count = 0

                # Inside the loop for role_assignments
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
                            print(f"{principal_details}, {role_name}, {role_description}")

                            # Count the principal types
                            if principal_type == "User":
                                user_count += 1
                            elif principal_type == "Group":
                                group_count += 1
                            elif principal_type == "ServicePrincipal":
                                sp_count += 1
                        else:
                            # Increment sp_count even if an error occurs
                            sp_count += 1
                            print(f"{principal_type} - {principal_id}, {role_name}, {role_description}")

                # Print the summary after each storage account
                print(f"\n{user_count + group_count + sp_count} items "
                      f"({user_count} Users, {group_count} Groups, {sp_count} Others)\n")

                if i != last_storage_account_index:
                    print("")
                    print("----------------------------------------------")
                    print("")
                else:
                    print("")
                    print("==========================================")
                    print("")

if __name__ == "__main__":
    with open('./json/su_and_resource.json', 'r') as file:
        subscription_and_resources = json.load(file)

    generate_report(subscription_and_resources)
