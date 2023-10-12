import json
import subprocess

# Function to get storage accounts for a specific subscription and resource group
def get_storage_accounts(subscription_id, resource_group_name):
    storage_cmd = f"az storage account list --subscription {subscription_id} --resource-group {resource_group_name} --output json"
    storage_output = subprocess.check_output(storage_cmd, shell=True, text=True)
    storage_accounts = json.loads(storage_output)
    return [f"subscriptions/{subscription_id}/resourceGroups/{resource_group_name}/providers/Microsoft.Storage/storageAccounts/{account['name']}" for account in storage_accounts]

# Get the list of subscriptions
subscriptions_cmd = "az account list --output json"
subscriptions_output = subprocess.check_output(subscriptions_cmd, shell=True, text=True)
subscriptions = json.loads(subscriptions_output)

# Initialize an empty dictionary
json_result = {}

# Loop through each subscription
for sub in subscriptions:
    subscription_id = sub.get("id")
    subscription_name = sub.get("name")

    if not subscription_id:
        print("WARNING: Subscription ID not found. Skipping.")
        continue

    print(f"Processing subscription: {subscription_name} (ID: {subscription_id})")

    # Execute az group list for the current subscription
    resource_groups_cmd = f"az group list --subscription {subscription_id} --output json"
    resource_groups_output = subprocess.check_output(resource_groups_cmd, shell=True, text=True)

    try:
        resource_groups = json.loads(resource_groups_output)
    except json.JSONDecodeError:
        print(f"WARNING: Failed to retrieve resource groups for subscription: {subscription_name} (ID: {subscription_id})")
        continue

    # Extract the names of resource groups
    resource_group_names = [rg.get("name") for rg in resource_groups]

    # Create an entry in the dictionary using subscription name
    json_result[subscription_name] = []

    # Add storage accounts for each resource group
    for resource_group_name in resource_group_names:
        storage_accounts = get_storage_accounts(subscription_id, resource_group_name)
        json_result[subscription_name].extend(storage_accounts)

# Save the JSON result to a file
with open("json/su_and_resource.json", "w") as json_file:
    json.dump(json_result, json_file, indent=2)
