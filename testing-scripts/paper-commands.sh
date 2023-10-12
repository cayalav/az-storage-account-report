az storage account list --output tsv | awk -F'\t' '{split($18, a, "/"); print a[length(a)]}'

az resource show --ids $(az storage account show --name advaemapigsauto1 --query id --output tsv)
subscription_id=$(az resource show --ids $(az storage account show --name advaemapigsauto1 --query id --output tsv) --query "id" --output tsv

az resource show --ids $(az storage account show --name advaemapigsauto1 --query id --output tsv) --query "id" --output tsv
/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvAdsEpisodesMgrApiPre/providers/Microsoft.Storage/storageAccounts/advaemapigsauto1
az account list --query "[?id=='ca5362b0-62c7-461e-9be3-44f1dcec4b46'].name" --output tsv


#Extractring the id from the storage_acount
az storage account show --name advaemapigsauto1 --query "id" --output tsv | cut -d'/' -f3
#Extracting the Suscription Name from that Suscription ID
az account list --query "[?id=='ca5362b0-62c7-461e-9be3-44f1dcec4b46'].name" --output tsv

#Combining the two commands:
az account list --query "[?id=='$(az storage account show --name advaemapigsauto1 --query 'id' --output tsv | cut -d'/' -f3)'].name" --output tsv


az role definition list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsqa1" --output tsv | awk '{ for (i=2; i<=NF; i++) printf "%s%s", $i, (i<NF ? " " : "\n") }' | sed 's/\/subscriptions.*\ 1\ /,/' | sed 's/Microsoft\.Authorization\/roleDefinitions//'
az role assignment list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsqa"


az role definition list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsqa1" --output tsv | awk '{ for (i=2; i<=NF; i++) printf "%s%s", $i, (i<NF ? " " : "\n") }' | sed 's/\/subscriptions.*\ 1\ /,/' | sed 's/Microsoft\.Authorization\/roleDefinitions//'

None 2022-04-01T00:43:09.446811+00:00 Provides access to create and manage dev boxes. ,DevCenter Dev Box User BuiltInRole  None 2023-03-27T15:08:57.713854+00:00
None 2022-04-01T01:58:38.047236+00:00 Provides access to manage project resources. ,DevCenter Project Admin BuiltInRole  None 2023-06-23T18:26:44.413027+00:00
None 2022-04-07T06:13:18.897502+00:00 View Virtual Machines in the portal and login as a local user configured on the arc server ,Virtual Machine Local User Login BuiltInRole  None 2022-04-17T01:05:14.234542+00:00
None 2022-04-13T23:34:21.171637+00:00 Azure Arc ScVmm Private Cloud User has permissions to use the ScVmm resources to deploy VMs. ,Azure Arc ScVmm Private Cloud User BuiltInRole  None 2023-05-22T15:13:03.223545+00:00

$access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiJodHRwczovL2dyYXBoLndpbmRvd3MubmV0LyIsImlzcyI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0LzU2YjczMWE4LWEyYWMtNGMzMi1iZjZiLTYxNjgxMGU5MTNjNi8iLCJpYXQiOjE2OTU5Mjg4ODgsIm5iZiI6MTY5NTkyODg4OCwiZXhwIjoxNjk1OTMzOTA2LCJhY3IiOiIxIiwiYWlvIjoiQVRRQXkvOFVBQUFBWURvZGM2WE5NTDhLbXhtLzJQU0FITGU5bFlhTGhWQlhyNi9NMEdrV0EraGpSNGNSVVRscHVDSms4anVreUVFSCIsImFtciI6WyJwd2QiXSwiYXBwaWQiOiJiYjhmMThiMC05YzM4LTQ4YzktYTg0Ny1lMWVmM2FmMDYwMmQiLCJhcHBpZGFjciI6IjAiLCJmYW1pbHlfbmFtZSI6IkF5YWxhIiwiZ2l2ZW5fbmFtZSI6IkNhcmxvcyIsImlwYWRkciI6IjE4MS4yMzYuMTI4Ljg4IiwibmFtZSI6IkF5YWxhLCBDYXJsb3MgLU5EIiwib2lkIjoiZmY4MmZmMTktNzUwMi00MjM2LWI5OTUtZDY1YjI3MGU2ZTljIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE2NDQ0OTE5MzctOTIwMDI2MjY2LTE0MTcwMDEzMzMtODE0NjA0IiwicHVpZCI6IjEwMDMyMDAyQzMxNTcxOEYiLCJyaCI6IjAuQVRnQXFERzNWcXlpTWt5X2EyRm9FT2tUeGdJQUFBQUFBQUFBd0FBQUFBQUFBQUE0QUhRLiIsInNjcCI6InJlc3RyaWN0ZWRfdXNlcl9pbXBlcnNvbmF0aW9uIiwic3ViIjoiWnR1REpPOVFBMzUtdnAxTW1fTEVOdlZ4eXVHcGowMjU2eW5hQlprTnprZyIsInRlbmFudF9yZWdpb25fc2NvcGUiOiJOQSIsInRpZCI6IjU2YjczMWE4LWEyYWMtNGMzMi1iZjZiLTYxNjgxMGU5MTNjNiIsInVuaXF1ZV9uYW1lIjoiQ2FybG9zLkF5YWxhLi1OREBkaXNuZXkuY29tIiwidXBuIjoiQ2FybG9zLkF5YWxhLi1OREBkaXNuZXkuY29tIiwidXRpIjoiS3ZCbG1DSW5aMFNGWWFQS1hDOHFBQSIsInZlciI6IjEuMCJ9.G97sAHXWq1rG66OGHUuWerLS3STkm1Vw2DaoHRYPb-pWpRP2IesKarYhhkXbo9SvjlZ-rCLgEuaOz2LzpIWWOSISN9B_-QC6kx-QjfKACoix579uCezEWEokxgnPCFdK8-84hJNRwz-_yf1byZ3XIfSK6M4eBOC6jGN5n318gB9gftqU6ak_0s1W68bsEvm4wzb4kH1c1B93CeEOdNpCEgThLlYOP8VOHFigoFGjuq0Y2TSwVYXHv7LICqrYtrncCXkf0Dx6qP7H6oofPA3UMQrAv0UL39P8eOi6pg00NH59o0rw7XHTTvrOUpBz4BNfI9H7elz_aeQCXocf7T7sJw

curl -H "Authorization: Bearer $access_token" "https://management.azure.com/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsauto1/providers/Microsoft.Authorization/roleAssignments\&?api-version=2020-04-01"

1	None	2023-09-14T21:20:02.942643+00:00	Community Contributor Role to access the resources of Microsoft.Mission stored with RPSAAS.	/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/providers/Microsoft.Authorization/roleDefinitions/49435da6-99fe-48a5-a235-fc668b9dc04a	49435da6-99fe-48a5-a235-fc668b9dc04a	1	Community Contributor Role	BuiltInRole	Microsoft.Authorization/roleDefinitions	None	2023-09-14T21:20:02.942643+00:00
1	None	2023-09-19T15:12:11.067414+00:00	Lets you subscribe messages on topicspaces.	/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/providers/Microsoft.Authorization/roleDefinitions/4b0f2fd7-60b4-4eca-896f-4435034f8bf5	4b0f2fd7-60b4-4eca-896f-4435034f8bf5	1	EventGrid TopicSpaces Subscriber	BuiltInRole	Microsoft.Authorization/roleDefinitions	None	2023-09-25T15:06:20.745949+00:00
1	None	2023-09-19T15:12:11.067414+00:00	Lets you publish messages on topicspaces.	/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/providers/Microsoft.Authorization/roleDefinitions/a12b0b94-b317-4dcd-84a8-502ce99884c6	a12b0b94-b317-4dcd-84a8-502ce99884c6	1	EventGrid TopicSpaces Publisher	BuiltInRole	Microsoft.Authorization/roleDefinitions	None	2023-09-25T15:06:20.745949+00:00
1	None	2023-09-25T15:06:19.918361+00:00	Allows tenant level administration for data boundaries.	/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/providers/Microsoft.Authorization/roleDefinitions/d1a38570-4b05-4d70-b8e4-1100bcf76d12	d1a38570-4b05-4d70-b8e4-1100bcf76d12	1	Data Boundary Tenant Administrator	BuiltInRole	Microsoft.Authorization/roleDefinitions	None	2023-09-25T15:06:19.918361+00:00


curl 'https://graph.windows.net/56b731a8-a2ac-4c32-bf6b-616810e913c6/getObjectsByObjectIds' \
  -H 'x-ms-client-session-id: 4710f6e0af2342fcbe33706d82c0e077' \
  -H 'x-ms-command-name: GetDirectoryObjectsByObjectIds.default' \
  -H 'Accept-Language: en' \
  -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiJodHRwczovL2dyYXBoLndpbmRvd3MubmV0LyIsImlzcyI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0LzU2YjczMWE4LWEyYWMtNGMzMi1iZjZiLTYxNjgxMGU5MTNjNi8iLCJpYXQiOjE2OTU4NDYwODYsIm5iZiI6MTY5NTg0NjA4NiwiZXhwIjoxNjk1ODUxMTE1LCJhY3IiOiIxIiwiYWlvIjoiQVRRQXkvOFVBQUFBbDNNb2FMeW5iNVZLQWMzck1DaUxiK1ZyUVVnQVZ1aVZ5UkVRMEtPeU5MdDBucUNSaWxpNTBRNlA5RnVVWHNZWiIsImFtciI6WyJwd2QiXSwiYXBwaWQiOiJiYjhmMThiMC05YzM4LTQ4YzktYTg0Ny1lMWVmM2FmMDYwMmQiLCJhcHBpZGFjciI6IjAiLCJmYW1pbHlfbmFtZSI6IkF5YWxhIiwiZ2l2ZW5fbmFtZSI6IkNhcmxvcyIsImlwYWRkciI6IjE4MS4yMzYuMTM5LjEwNSIsIm5hbWUiOiJBeWFsYSwgQ2FybG9zIC1ORCIsIm9pZCI6ImZmODJmZjE5LTc1MDItNDIzNi1iOTk1LWQ2NWIyNzBlNmU5YyIsIm9ucHJlbV9zaWQiOiJTLTEtNS0yMS0xNjQ0NDkxOTM3LTkyMDAyNjI2Ni0xNDE3MDAxMzMzLTgxNDYwNCIsInB1aWQiOiIxMDAzMjAwMkMzMTU3MThGIiwicmgiOiIwLkFUZ0FxREczVnF5aU1reV9hMkZvRU9rVHhnSUFBQUFBQUFBQXdBQUFBQUFBQUFBNEFIUS4iLCJzY3AiOiJyZXN0cmljdGVkX3VzZXJfaW1wZXJzb25hdGlvbiIsInN1YiI6Ilp0dURKTzlRQTM1LXZwMU1tX0xFTnZWeHl1R3BqMDI1NnluYUJaa056a2ciLCJ0ZW5hbnRfcmVnaW9uX3Njb3BlIjoiTkEiLCJ0aWQiOiI1NmI3MzFhOC1hMmFjLTRjMzItYmY2Yi02MTY4MTBlOTEzYzYiLCJ1bmlxdWVfbmFtZSI6IkNhcmxvcy5BeWFsYS4tTkRAZGlzbmV5LmNvbSIsInVwbiI6IkNhcmxvcy5BeWFsYS4tTkRAZGlzbmV5LmNvbSIsInV0aSI6InhibjVjSzVjVFV1QTJSNkl4MjZ3QUEiLCJ2ZXIiOiIxLjAifQ.qTM7koBrmdpqvWOP3gaHDA9tjlY5AwL2Aw2ltDB9hieFRAb2e_eI_Mp8R_FCCfqwYodE4p5tY7ARQYoJB3KEx6Yx1XlNsniinQr2me7n5QTBYJRWRgRTnzwqAOZb8XIpbXdnizz6rbpNFxFPERHnQDBibOVVKosRnXhLza9-jy5B4wCAJ04TZmbKwqo7QTuLPPY-K7_PyVJ791ze1ijht93PFjAAzALfhuq-AMmeiNxZdqKPf46w6pXyvUzLTj3ZCFFHM-WVsAAQpeLf_xoRGpExl48fB_gN9__bMrp1SyX6ejiq7J7kHDDIWDUYKcrVTyrWPmOjc0714FJvTnhaog' \
  -H 'x-ms-effective-locale: en.en-us' \
  -H 'Content-Type: application/json' \
  -H 'Accept: */*' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 OPR/102.0.0.0' \
  -H 'Referer;' \
  -H 'x-ms-client-request-id: 36201234-3358-4e96-bbea-1ae166587021' \
  -H 'api-version: 1.61-internal' \
  --data-raw '{"objectIds":["d61f4e1e-6db6-4efa-a162-588431ddf021","cb61b22b-1ea0-43fa-9045-db7228337cd0","acd28510-7e7c-403b-b229-77f266631473","d58aa431-49a5-4250-aa5a-27f851e358a0","f88e29fb-db19-4ac3-b107-02347920a41d","a6604fc2-6153-481c-b63c-bc44ad271e9a","b5820cf4-f786-4495-936e-2f2723a9d434","d6ce9c5b-e62e-4a9f-8e9a-97630c91eb14","a74e10cc-41e3-4ba1-8eab-9a3396531623","9af1acee-0f93-404d-8c61-7cbd589b08d4","e2459c9b-e238-46e3-8d58-134f79495475","493d8ffa-2fdb-468e-a403-02c327bf9537","4030d715-c500-4f02-92f1-29b36cc0b30c","c108fd56-55bc-4e64-b367-7c06762d9cba","bad2e498-00e3-416a-9c13-80602ac76961","5a951c35-aab8-4740-b71a-6912e587bbe1","5a335244-3aa3-4c2c-bfac-2a858a5dda09","b1958e69-c84b-4dc4-a944-96b98c9479a0","47bf1a56-de7a-4a0e-84ed-5e07b6e09d27","1ff11f4c-7095-415d-9e68-43b99a5b6d70","bb24cccc-ebc8-43a3-90d7-3de935727b72","c30ef4ca-af7b-4cff-99a8-be6bb37a5e12","fad73ef0-b77f-45e6-85e4-75295a2213d2","2a25858b-7573-42d2-b82b-bd5619b0f400","ed117315-6e4e-4e28-a43b-8aa0d48b0907","5c88ee60-e7fd-47ba-9ccb-7c3955a41ca9","ab436125-5684-4c84-b857-d119ffce4ad5","7ccafa0b-7ab9-4c01-87c2-e13514aaebfd","8179959e-e38e-4bb8-9a1e-a77e36518df2","e42e19dd-25fd-4e0c-a390-b8873c4aad37","c3197a2e-e709-4169-a4fc-da6d759e4bf9","01ea748c-ef60-4260-a025-fc50c39fff99","f9f0dee7-4cdd-4f34-bd76-2ad2635cf958","d9bc5f5d-97da-4a33-9366-b398f76e98f0","21d8b258-0826-46bc-a062-ffa3e275ca81","958eeb6e-4bc1-400b-a800-b8f755f23c26","6f47c186-a685-4a64-a724-1a254bd8fb2b","45ac8a63-be08-41cd-b63c-69bc4aab0621","66ff7d44-9e2d-4509-b8d1-6ab1ef7bcb67","19f981c2-a0df-4164-a309-d2ebd9528c0b","0783877e-a3c6-434d-94d8-0dc50c332829","3aab110a-c12d-4e6f-bbdf-3f6faf3d50c0","91f14d44-39af-4a3c-938a-ec621c26e43e","626a84a2-c3f7-4972-8bc6-2f4a9efa3044","4fb3c8be-3010-4947-8728-2626f1b37357","e8ff74bd-c713-4f62-b927-2131c5bbd4ec","2cede0ad-6bb7-4f42-a577-83586f152eb9","26efc293-0433-4d27-bdad-9ed5fba6485e","8312dcee-9c4b-4bfe-8402-3afeb1317443","25018a51-57c6-4c79-b2ca-74896cc934c5","baf1be32-6e41-42b3-83ad-768a0bb962c8","0365c2b4-35eb-4e51-b913-6024cdedf08c","dd7848ce-3a86-4898-844a-ef21b94480d0","3982f90a-117d-4415-87dc-4b650270a5a9","24733f1f-8719-4e7c-8618-5837e0d610ce","5595e486-4cb5-4b04-9116-4a6e8d3a3b26","d29fa4f7-0af6-4b71-ae98-37b7057e4377","555a5c31-c79d-4d9c-984e-dfa642b97470","d43afea0-99d2-478e-bdf6-64bcda333cf9","003d7813-e27d-4826-a257-858cd066e69c","f2aae8cd-43bb-4931-b4e3-a4102ec1c5fd","380f82d2-a506-4aa8-9554-a7f05beb2d4f","d47d5d4a-d7a9-4997-8e18-217ee3eb1697","303e52c5-eeba-49da-a631-19cd1a95055a"],"includeDirectoryObjectReferences":true}' \
  --compressed

curl 'https://graph.windows.net/56b731a8-a2ac-4c32-bf6b-616810e913c6/getObjectsByObjectIds' \
  -H 'x-ms-client-session-id: 4dcdce27f26c4b1996b53934344271d4' \
  -H 'x-ms-command-name: GetDirectoryObjectsByObjectIds.default' \
  -H 'Accept-Language: en' \
  -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiJodHRwczovL2dyYXBoLndpbmRvd3MubmV0LyIsImlzcyI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0LzU2YjczMWE4LWEyYWMtNGMzMi1iZjZiLTYxNjgxMGU5MTNjNi8iLCJpYXQiOjE2OTU5Mjg4ODgsIm5iZiI6MTY5NTkyODg4OCwiZXhwIjoxNjk1OTMzOTA2LCJhY3IiOiIxIiwiYWlvIjoiQVRRQXkvOFVBQUFBWURvZGM2WE5NTDhLbXhtLzJQU0FITGU5bFlhTGhWQlhyNi9NMEdrV0EraGpSNGNSVVRscHVDSms4anVreUVFSCIsImFtciI6WyJwd2QiXSwiYXBwaWQiOiJiYjhmMThiMC05YzM4LTQ4YzktYTg0Ny1lMWVmM2FmMDYwMmQiLCJhcHBpZGFjciI6IjAiLCJmYW1pbHlfbmFtZSI6IkF5YWxhIiwiZ2l2ZW5fbmFtZSI6IkNhcmxvcyIsImlwYWRkciI6IjE4MS4yMzYuMTI4Ljg4IiwibmFtZSI6IkF5YWxhLCBDYXJsb3MgLU5EIiwib2lkIjoiZmY4MmZmMTktNzUwMi00MjM2LWI5OTUtZDY1YjI3MGU2ZTljIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE2NDQ0OTE5MzctOTIwMDI2MjY2LTE0MTcwMDEzMzMtODE0NjA0IiwicHVpZCI6IjEwMDMyMDAyQzMxNTcxOEYiLCJyaCI6IjAuQVRnQXFERzNWcXlpTWt5X2EyRm9FT2tUeGdJQUFBQUFBQUFBd0FBQUFBQUFBQUE0QUhRLiIsInNjcCI6InJlc3RyaWN0ZWRfdXNlcl9pbXBlcnNvbmF0aW9uIiwic3ViIjoiWnR1REpPOVFBMzUtdnAxTW1fTEVOdlZ4eXVHcGowMjU2eW5hQlprTnprZyIsInRlbmFudF9yZWdpb25fc2NvcGUiOiJOQSIsInRpZCI6IjU2YjczMWE4LWEyYWMtNGMzMi1iZjZiLTYxNjgxMGU5MTNjNiIsInVuaXF1ZV9uYW1lIjoiQ2FybG9zLkF5YWxhLi1OREBkaXNuZXkuY29tIiwidXBuIjoiQ2FybG9zLkF5YWxhLi1OREBkaXNuZXkuY29tIiwidXRpIjoiS3ZCbG1DSW5aMFNGWWFQS1hDOHFBQSIsInZlciI6IjEuMCJ9.G97sAHXWq1rG66OGHUuWerLS3STkm1Vw2DaoHRYPb-pWpRP2IesKarYhhkXbo9SvjlZ-rCLgEuaOz2LzpIWWOSISN9B_-QC6kx-QjfKACoix579uCezEWEokxgnPCFdK8-84hJNRwz-_yf1byZ3XIfSK6M4eBOC6jGN5n318gB9gftqU6ak_0s1W68bsEvm4wzb4kH1c1B93CeEOdNpCEgThLlYOP8VOHFigoFGjuq0Y2TSwVYXHv7LICqrYtrncCXkf0Dx6qP7H6oofPA3UMQrAv0UL39P8eOi6pg00NH59o0rw7XHTTvrOUpBz4BNfI9H7elz_aeQCXocf7T7sJw' \
  -H 'x-ms-effective-locale: en.en-us' \
  -H 'Content-Type: application/json' \
  -H 'Accept: */*' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 OPR/102.0.0.0' \
  -H 'Referer;' \
  -H 'x-ms-client-request-id: 41c0196f-9d75-4a02-bc35-82c2e279c00a' \
  -H 'api-version: 1.61-internal' \
  --data-raw '{"objectIds":["d61f4e1e-6db6-4efa-a162-588431ddf021","cb61b22b-1ea0-43fa-9045-db7228337cd0","acd28510-7e7c-403b-b229-77f266631473","d58aa431-49a5-4250-aa5a-27f851e358a0","f88e29fb-db19-4ac3-b107-02347920a41d","a6604fc2-6153-481c-b63c-bc44ad271e9a","b5820cf4-f786-4495-936e-2f2723a9d434","d6ce9c5b-e62e-4a9f-8e9a-97630c91eb14","a74e10cc-41e3-4ba1-8eab-9a3396531623","9af1acee-0f93-404d-8c61-7cbd589b08d4","e2459c9b-e238-46e3-8d58-134f79495475","493d8ffa-2fdb-468e-a403-02c327bf9537","4030d715-c500-4f02-92f1-29b36cc0b30c","c108fd56-55bc-4e64-b367-7c06762d9cba","bad2e498-00e3-416a-9c13-80602ac76961","5a951c35-aab8-4740-b71a-6912e587bbe1","5a335244-3aa3-4c2c-bfac-2a858a5dda09","b1958e69-c84b-4dc4-a944-96b98c9479a0","47bf1a56-de7a-4a0e-84ed-5e07b6e09d27","1ff11f4c-7095-415d-9e68-43b99a5b6d70","bb24cccc-ebc8-43a3-90d7-3de935727b72","c30ef4ca-af7b-4cff-99a8-be6bb37a5e12","fad73ef0-b77f-45e6-85e4-75295a2213d2","2a25858b-7573-42d2-b82b-bd5619b0f400","ed117315-6e4e-4e28-a43b-8aa0d48b0907","5c88ee60-e7fd-47ba-9ccb-7c3955a41ca9","ab436125-5684-4c84-b857-d119ffce4ad5","7ccafa0b-7ab9-4c01-87c2-e13514aaebfd","8179959e-e38e-4bb8-9a1e-a77e36518df2","e42e19dd-25fd-4e0c-a390-b8873c4aad37","c3197a2e-e709-4169-a4fc-da6d759e4bf9","01ea748c-ef60-4260-a025-fc50c39fff99","f9f0dee7-4cdd-4f34-bd76-2ad2635cf958","d9bc5f5d-97da-4a33-9366-b398f76e98f0","21d8b258-0826-46bc-a062-ffa3e275ca81","958eeb6e-4bc1-400b-a800-b8f755f23c26","6f47c186-a685-4a64-a724-1a254bd8fb2b","45ac8a63-be08-41cd-b63c-69bc4aab0621","66ff7d44-9e2d-4509-b8d1-6ab1ef7bcb67","19f981c2-a0df-4164-a309-d2ebd9528c0b","0783877e-a3c6-434d-94d8-0dc50c332829","3aab110a-c12d-4e6f-bbdf-3f6faf3d50c0","91f14d44-39af-4a3c-938a-ec621c26e43e","626a84a2-c3f7-4972-8bc6-2f4a9efa3044","4fb3c8be-3010-4947-8728-2626f1b37357","e8ff74bd-c713-4f62-b927-2131c5bbd4ec","2cede0ad-6bb7-4f42-a577-83586f152eb9","26efc293-0433-4d27-bdad-9ed5fba6485e","8312dcee-9c4b-4bfe-8402-3afeb1317443","25018a51-57c6-4c79-b2ca-74896cc934c5","baf1be32-6e41-42b3-83ad-768a0bb962c8","0365c2b4-35eb-4e51-b913-6024cdedf08c","dd7848ce-3a86-4898-844a-ef21b94480d0","3982f90a-117d-4415-87dc-4b650270a5a9","24733f1f-8719-4e7c-8618-5837e0d610ce","5595e486-4cb5-4b04-9116-4a6e8d3a3b26","d29fa4f7-0af6-4b71-ae98-37b7057e4377","555a5c31-c79d-4d9c-984e-dfa642b97470","d43afea0-99d2-478e-bdf6-64bcda333cf9","003d7813-e27d-4826-a257-858cd066e69c","f2aae8cd-43bb-4931-b4e3-a4102ec1c5fd","380f82d2-a506-4aa8-9554-a7f05beb2d4f","d47d5d4a-d7a9-4997-8e18-217ee3eb1697","303e52c5-eeba-49da-a631-19cd1a95055a"],"includeDirectoryObjectReferences":true}' \
  --compressed

az rest -m get --header "Accept=application/json" -u 'https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Web/sites?api-version=2016-08-01'

az role assignment list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvAdsEpisodesMgrApiPre/providers/Microsoft.Storage/storageAccounts/advaemapigsauto1" --output table

az storage account show --name advaemapigsauto1 --resource-group AdvAdsEpisodesMgrApiPre --query id --output tsv

az role assignment list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvAdsEpisodesMgrApiPre/providers/Microsoft.Storage/storageAccounts/advaemapigsauto1" --output table --query "[].{Name: principalName, Type: principalType, Role: roleDefinitionName, Scope: scope, Condition: condition}"



#All roles for this suscription:
az role assignment list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46" --output table

az role assignment list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvAdsEpisodesMgrApiPre" --output table

az role assignment list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvAdsEpisodesMgrApiPre/providers/Microsoft.Storage/storageAccounts/advaemapigsauto1" --output table


advisorakseuspre-admin
advisorakseusprod-admin
advisorakswuspre-admin
advisorakswusprod-admin
devopsakspre-admin
devopsaksprod-admin


az role assignment list --output json
az role assignment list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvAdsEpisodesMgrApiPre/providers/Microsoft.Storage/storageAccounts/advaemapigsauto1" --output json

curl 'https://graph.windows.net/56b731a8-a2ac-4c32-bf6b-616810e913c6/getObjectsByObjectIds' \
  -H 'x-ms-client-session-id: 4dcdce27f26c4b1996b53934344271d4' \
  -H 'x-ms-command-name: GetDirectoryObjectsByObjectIds.default' \
  -H 'Accept-Language: en' \
  -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiJodHRwczovL2dyYXBoLndpbmRvd3MubmV0LyIsImlzcyI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0LzU2YjczMWE4LWEyYWMtNGMzMi1iZjZiLTYxNjgxMGU5MTNjNi8iLCJpYXQiOjE2OTU5Mjg4ODgsIm5iZiI6MTY5NTkyODg4OCwiZXhwIjoxNjk1OTMzOTA2LCJhY3IiOiIxIiwiYWlvIjoiQVRRQXkvOFVBQUFBWURvZGM2WE5NTDhLbXhtLzJQU0FITGU5bFlhTGhWQlhyNi9NMEdrV0EraGpSNGNSVVRscHVDSms4anVreUVFSCIsImFtciI6WyJwd2QiXSwiYXBwaWQiOiJiYjhmMThiMC05YzM4LTQ4YzktYTg0Ny1lMWVmM2FmMDYwMmQiLCJhcHBpZGFjciI6IjAiLCJmYW1pbHlfbmFtZSI6IkF5YWxhIiwiZ2l2ZW5fbmFtZSI6IkNhcmxvcyIsImlwYWRkciI6IjE4MS4yMzYuMTI4Ljg4IiwibmFtZSI6IkF5YWxhLCBDYXJsb3MgLU5EIiwib2lkIjoiZmY4MmZmMTktNzUwMi00MjM2LWI5OTUtZDY1YjI3MGU2ZTljIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE2NDQ0OTE5MzctOTIwMDI2MjY2LTE0MTcwMDEzMzMtODE0NjA0IiwicHVpZCI6IjEwMDMyMDAyQzMxNTcxOEYiLCJyaCI6IjAuQVRnQXFERzNWcXlpTWt5X2EyRm9FT2tUeGdJQUFBQUFBQUFBd0FBQUFBQUFBQUE0QUhRLiIsInNjcCI6InJlc3RyaWN0ZWRfdXNlcl9pbXBlcnNvbmF0aW9uIiwic3ViIjoiWnR1REpPOVFBMzUtdnAxTW1fTEVOdlZ4eXVHcGowMjU2eW5hQlprTnprZyIsInRlbmFudF9yZWdpb25fc2NvcGUiOiJOQSIsInRpZCI6IjU2YjczMWE4LWEyYWMtNGMzMi1iZjZiLTYxNjgxMGU5MTNjNiIsInVuaXF1ZV9uYW1lIjoiQ2FybG9zLkF5YWxhLi1OREBkaXNuZXkuY29tIiwidXBuIjoiQ2FybG9zLkF5YWxhLi1OREBkaXNuZXkuY29tIiwidXRpIjoiS3ZCbG1DSW5aMFNGWWFQS1hDOHFBQSIsInZlciI6IjEuMCJ9.G97sAHXWq1rG66OGHUuWerLS3STkm1Vw2DaoHRYPb-pWpRP2IesKarYhhkXbo9SvjlZ-rCLgEuaOz2LzpIWWOSISN9B_-QC6kx-QjfKACoix579uCezEWEokxgnPCFdK8-84hJNRwz-_yf1byZ3XIfSK6M4eBOC6jGN5n318gB9gftqU6ak_0s1W68bsEvm4wzb4kH1c1B93CeEOdNpCEgThLlYOP8VOHFigoFGjuq0Y2TSwVYXHv7LICqrYtrncCXkf0Dx6qP7H6oofPA3UMQrAv0UL39P8eOi6pg00NH59o0rw7XHTTvrOUpBz4BNfI9H7elz_aeQCXocf7T7sJw' \
  -H 'x-ms-effective-locale: en.en-us' \
  -H 'Content-Type: application/json' \
  -H 'Accept: */*' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 OPR/102.0.0.0' \
  -H 'Referer;' \
  -H 'x-ms-client-request-id: 41c0196f-9d75-4a02-bc35-82c2e279c013' \
  -H 'api-version: 1.61-internal' \
  --data-raw '{"objectIds":["d61f4e1e-6db6-4efa-a162-588431ddf021","cb61b22b-1ea0-43fa-9045-db7228337cd0","acd28510-7e7c-403b-b229-77f266631473","d58aa431-49a5-4250-aa5a-27f851e358a0","f88e29fb-db19-4ac3-b107-02347920a41d","a6604fc2-6153-481c-b63c-bc44ad271e9a","b5820cf4-f786-4495-936e-2f2723a9d434","d6ce9c5b-e62e-4a9f-8e9a-97630c91eb14","a74e10cc-41e3-4ba1-8eab-9a3396531623","9af1acee-0f93-404d-8c61-7cbd589b08d4","e2459c9b-e238-46e3-8d58-134f79495475","493d8ffa-2fdb-468e-a403-02c327bf9537","4030d715-c500-4f02-92f1-29b36cc0b30c","c108fd56-55bc-4e64-b367-7c06762d9cba","bad2e498-00e3-416a-9c13-80602ac76961","5a951c35-aab8-4740-b71a-6912e587bbe1","5a335244-3aa3-4c2c-bfac-2a858a5dda09","b1958e69-c84b-4dc4-a944-96b98c9479a0","47bf1a56-de7a-4a0e-84ed-5e07b6e09d27","1ff11f4c-7095-415d-9e68-43b99a5b6d70","bb24cccc-ebc8-43a3-90d7-3de935727b72","c30ef4ca-af7b-4cff-99a8-be6bb37a5e12","fad73ef0-b77f-45e6-85e4-75295a2213d2","2a25858b-7573-42d2-b82b-bd5619b0f400","ed117315-6e4e-4e28-a43b-8aa0d48b0907","5c88ee60-e7fd-47ba-9ccb-7c3955a41ca9","ab436125-5684-4c84-b857-d119ffce4ad5","7ccafa0b-7ab9-4c01-87c2-e13514aaebfd","8179959e-e38e-4bb8-9a1e-a77e36518df2","e42e19dd-25fd-4e0c-a390-b8873c4aad37","c3197a2e-e709-4169-a4fc-da6d759e4bf9","01ea748c-ef60-4260-a025-fc50c39fff99","f9f0dee7-4cdd-4f34-bd76-2ad2635cf958","d9bc5f5d-97da-4a33-9366-b398f76e98f0","21d8b258-0826-46bc-a062-ffa3e275ca81","958eeb6e-4bc1-400b-a800-b8f755f23c26","6f47c186-a685-4a64-a724-1a254bd8fb2b","45ac8a63-be08-41cd-b63c-69bc4aab0621","66ff7d44-9e2d-4509-b8d1-6ab1ef7bcb67","19f981c2-a0df-4164-a309-d2ebd9528c0b","0783877e-a3c6-434d-94d8-0dc50c332829","3aab110a-c12d-4e6f-bbdf-3f6faf3d50c0","91f14d44-39af-4a3c-938a-ec621c26e43e","626a84a2-c3f7-4972-8bc6-2f4a9efa3044","4fb3c8be-3010-4947-8728-2626f1b37357","e8ff74bd-c713-4f62-b927-2131c5bbd4ec","2cede0ad-6bb7-4f42-a577-83586f152eb9","26efc293-0433-4d27-bdad-9ed5fba6485e","8312dcee-9c4b-4bfe-8402-3afeb1317443","25018a51-57c6-4c79-b2ca-74896cc934c5","baf1be32-6e41-42b3-83ad-768a0bb962c8","0365c2b4-35eb-4e51-b913-6024cdedf08c","dd7848ce-3a86-4898-844a-ef21b94480d0","3982f90a-117d-4415-87dc-4b650270a5a9","24733f1f-8719-4e7c-8618-5837e0d610ce","5595e486-4cb5-4b04-9116-4a6e8d3a3b26","d29fa4f7-0af6-4b71-ae98-37b7057e4377","555a5c31-c79d-4d9c-984e-dfa642b97470","d43afea0-99d2-478e-bdf6-64bcda333cf9","003d7813-e27d-4826-a257-858cd066e69c","f2aae8cd-43bb-4931-b4e3-a4102ec1c5fd","380f82d2-a506-4aa8-9554-a7f05beb2d4f","d47d5d4a-d7a9-4997-8e18-217ee3eb1697","303e52c5-eeba-49da-a631-19cd1a95055a"],"includeDirectoryObjectReferences":true}' \
  --compressed

az rest --method get --header "Accept=application/json" -u 'https://management.azure.com/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsauto1/providers/Microsoft.Authorization/roleAssignments?api-version=2020-10-01-preview'
az rest --method get --header "Accept=application/json" -u 'https://management.azure.com/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsauto2/providers/Microsoft.Authorization/roleAssignments?api-version=2020-10-01-preview'

az role definition list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsqa2" --output json
az role definition list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdVisorCdcWusPre/providers/Microsoft.Storage/storageAccounts/advisorcdcwuspred" --output json
az role definition list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvAseWusPre.QA2/providers/Microsoft.Storage/storageAccounts/advilogoptapigswusqa2" --output json

az account list --output table
az account list --query "[].{SubscriptionId:id,SubscriptionName:name}" --output table

az group show --name AdVisorSupport --output json

curl 'https://graph.windows.net/56b731a8-a2ac-4c32-bf6b-616810e913c6/getObjectsByObjectIds' \
  -H 'x-ms-client-session-id: 377864dd47eb42fc8a10c8ba35ad0247' \
  -H 'x-ms-command-name: GetDirectoryObjectsByObjectIds.default' \
  -H 'Accept-Language: en' \
  -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiJodHRwczovL2dyYXBoLndpbmRvd3MubmV0LyIsImlzcyI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0LzU2YjczMWE4LWEyYWMtNGMzMi1iZjZiLTYxNjgxMGU5MTNjNi8iLCJpYXQiOjE2OTYyNjU2ODYsIm5iZiI6MTY5NjI2NTY4NiwiZXhwIjoxNjk2MjcwMTIyLCJhY3IiOiIxIiwiYWlvIjoiQVRRQXkvOFVBQUFBSXpSZWdBWXJmS0poK3duQmZtSlp3T2tJRG1UTHpKZ0thQ0pBK0wxY0JLaG55c3RXSnFKVS9ac0FoNTZKZzR1UCIsImFtciI6WyJwd2QiXSwiYXBwaWQiOiJiYjhmMThiMC05YzM4LTQ4YzktYTg0Ny1lMWVmM2FmMDYwMmQiLCJhcHBpZGFjciI6IjAiLCJmYW1pbHlfbmFtZSI6IkF5YWxhIiwiZ2l2ZW5fbmFtZSI6IkNhcmxvcyIsImlwYWRkciI6IjE4MS4yMzYuMTI4Ljg4IiwibmFtZSI6IkF5YWxhLCBDYXJsb3MgLU5EIiwib2lkIjoiZmY4MmZmMTktNzUwMi00MjM2LWI5OTUtZDY1YjI3MGU2ZTljIiwib25wcmVtX3NpZCI6IlMtMS01LTIxLTE2NDQ0OTE5MzctOTIwMDI2MjY2LTE0MTcwMDEzMzMtODE0NjA0IiwicHVpZCI6IjEwMDMyMDAyQzMxNTcxOEYiLCJyaCI6IjAuQVRnQXFERzNWcXlpTWt5X2EyRm9FT2tUeGdJQUFBQUFBQUFBd0FBQUFBQUFBQUE0QUhRLiIsInNjcCI6InJlc3RyaWN0ZWRfdXNlcl9pbXBlcnNvbmF0aW9uIiwic3ViIjoiWnR1REpPOVFBMzUtdnAxTW1fTEVOdlZ4eXVHcGowMjU2eW5hQlprTnprZyIsInRlbmFudF9yZWdpb25fc2NvcGUiOiJOQSIsInRpZCI6IjU2YjczMWE4LWEyYWMtNGMzMi1iZjZiLTYxNjgxMGU5MTNjNiIsInVuaXF1ZV9uYW1lIjoiQ2FybG9zLkF5YWxhLi1OREBkaXNuZXkuY29tIiwidXBuIjoiQ2FybG9zLkF5YWxhLi1OREBkaXNuZXkuY29tIiwidXRpIjoibG0wQWVBZzF3RUdFcTBlVnk0b3RBQSIsInZlciI6IjEuMCJ9.lngiQRqcQkvupeUO_6O7eQCxfvPAfiYUqm6-g8ZavmeGAR4NW34hfb8hOo-bo_KydvMSbr3ZzYzldaEFdIIROyYexzdGkihXYkQfSNPDX6K-w7K9XWFFAxqA99TmNk2tc7VGJGK66SHGZ1p6aXwBHuZDaW_QXhVD-frvgxo1YU_kvzkQ2ayRJcrhOEVyddmZa_guiA75i6NB1-NWyWNnCR7C37rt_8YejVkksqsKaUwHa-E8oijGuuT3cSPTWG4sFFTG5rrJR6pfAG0zUJrIICQ4s77kKNUa3VWuEdQbZvqancRlRpDay043nOfy69D2TrPOgQVPIUDlSjdbi7ulKA' \
  -H 'x-ms-effective-locale: en.en-us' \
  -H 'Content-Type: application/json' \
  -H 'Accept: */*' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 OPR/102.0.0.0' \
  -H 'Referer;' \
  -H 'x-ms-client-request-id: 7e51aac1-842e-4bf3-a4ce-9ccc45d25023' \
  -H 'api-version: 1.61-internal' \
  --data-raw '{"objectIds":["d61f4e1e-6db6-4efa-a162-588431ddf021","cb61b22b-1ea0-43fa-9045-db7228337cd0","acd28510-7e7c-403b-b229-77f266631473","d58aa431-49a5-4250-aa5a-27f851e358a0","f88e29fb-db19-4ac3-b107-02347920a41d","a6604fc2-6153-481c-b63c-bc44ad271e9a","b5820cf4-f786-4495-936e-2f2723a9d434","d6ce9c5b-e62e-4a9f-8e9a-97630c91eb14","a74e10cc-41e3-4ba1-8eab-9a3396531623","9af1acee-0f93-404d-8c61-7cbd589b08d4","e2459c9b-e238-46e3-8d58-134f79495475","493d8ffa-2fdb-468e-a403-02c327bf9537","4030d715-c500-4f02-92f1-29b36cc0b30c","c108fd56-55bc-4e64-b367-7c06762d9cba","bad2e498-00e3-416a-9c13-80602ac76961","5a951c35-aab8-4740-b71a-6912e587bbe1","5a335244-3aa3-4c2c-bfac-2a858a5dda09","b1958e69-c84b-4dc4-a944-96b98c9479a0","47bf1a56-de7a-4a0e-84ed-5e07b6e09d27","1ff11f4c-7095-415d-9e68-43b99a5b6d70","bb24cccc-ebc8-43a3-90d7-3de935727b72","c30ef4ca-af7b-4cff-99a8-be6bb37a5e12","fad73ef0-b77f-45e6-85e4-75295a2213d2","2a25858b-7573-42d2-b82b-bd5619b0f400","ed117315-6e4e-4e28-a43b-8aa0d48b0907","5c88ee60-e7fd-47ba-9ccb-7c3955a41ca9","ab436125-5684-4c84-b857-d119ffce4ad5","7ccafa0b-7ab9-4c01-87c2-e13514aaebfd","8179959e-e38e-4bb8-9a1e-a77e36518df2","e42e19dd-25fd-4e0c-a390-b8873c4aad37","0488c2a8-cdff-437e-989a-7f47ff9e7ac1","c3197a2e-e709-4169-a4fc-da6d759e4bf9","01ea748c-ef60-4260-a025-fc50c39fff99","f9f0dee7-4cdd-4f34-bd76-2ad2635cf958","d9bc5f5d-97da-4a33-9366-b398f76e98f0","21d8b258-0826-46bc-a062-ffa3e275ca81","958eeb6e-4bc1-400b-a800-b8f755f23c26","6f47c186-a685-4a64-a724-1a254bd8fb2b","45ac8a63-be08-41cd-b63c-69bc4aab0621","66ff7d44-9e2d-4509-b8d1-6ab1ef7bcb67","19f981c2-a0df-4164-a309-d2ebd9528c0b","0783877e-a3c6-434d-94d8-0dc50c332829","3aab110a-c12d-4e6f-bbdf-3f6faf3d50c0","91f14d44-39af-4a3c-938a-ec621c26e43e","626a84a2-c3f7-4972-8bc6-2f4a9efa3044","4fb3c8be-3010-4947-8728-2626f1b37357","e8ff74bd-c713-4f62-b927-2131c5bbd4ec","2cede0ad-6bb7-4f42-a577-83586f152eb9","26efc293-0433-4d27-bdad-9ed5fba6485e","8312dcee-9c4b-4bfe-8402-3afeb1317443","25018a51-57c6-4c79-b2ca-74896cc934c5","baf1be32-6e41-42b3-83ad-768a0bb962c8","0365c2b4-35eb-4e51-b913-6024cdedf08c","dd7848ce-3a86-4898-844a-ef21b94480d0","3982f90a-117d-4415-87dc-4b650270a5a9","24733f1f-8719-4e7c-8618-5837e0d610ce","5595e486-4cb5-4b04-9116-4a6e8d3a3b26","d29fa4f7-0af6-4b71-ae98-37b7057e4377","555a5c31-c79d-4d9c-984e-dfa642b97470","d43afea0-99d2-478e-bdf6-64bcda333cf9","003d7813-e27d-4826-a257-858cd066e69c","f2aae8cd-43bb-4931-b4e3-a4102ec1c5fd","380f82d2-a506-4aa8-9554-a7f05beb2d4f","d47d5d4a-d7a9-4997-8e18-217ee3eb1697","303e52c5-eeba-49da-a631-19cd1a95055a"],"includeDirectoryObjectReferences":true}' \
  --compressed

az ad user show --id d61f4e1e-6db6-4efa-a162-588431ddf021 acd28510-7e7c-403b-b229-77f266631473 --output json


----------------------------


#Suscription:
az account list --output json | jq -r '[.[] | {name: .name, id: .id}]' > json/subscriptions.json

#Resource groups: 
az group list --output json | jq -r '[.[].name]' > json/resource-groups.json


az rest --method get --header "Accept=application/json" -u 'https://management.azure.com/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsauto1/providers/Microsoft.Authorization/roleAssignments?api-version=2020-10-01-preview' | jq -r '.value[] | {name, principalId: .properties.principalId, principalType: .properties.principalType, roleDefinitionId: (.properties.roleDefinitionId | split("/") | last)}'

##TWo Queries

#Only Users:
az rest --method get --header "Accept=application/json" -u 'https://management.azure.com/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsauto1/providers/Microsoft.Authorization/roleAssignments?api-version=2020-10-01-preview' | jq -r '.value[] | select(.properties.principalType == "User") | {name, principalId: .properties.principalId, principalType: .properties.principalType, roleDefinitionId: (.properties.roleDefinitionId | split("/") | last)}'
az role definition list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsauto1" --output json

az rest --method get --header "Accept=application/json" -u 'https://management.azure.com/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsauto1/providers/Microsoft.Authorization/roleAssignments?api-version=2020-10-01-preview' | jq -r '.value[] | select(.properties.principalType == "User") | {name, principalId: .properties.principalId, principalType: .properties.principalType, roleDefinitionId: (.properties.roleDefinitionId | split("/") | last)}'
az role definition list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsauto1" --output json | jq -r '.[] | {description, roleName}'

az ad user show --id 8312dcee-9c4b-4bfe-8402-3afeb1317443 --output json | jq -r '{displayName, mail}'



#Good Json:

#Role Assignment
#echo "[" > json/ra.json && az rest --method get --header "Accept=application/json" -u 'https://management.azure.com/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsauto1/providers/Microsoft.Authorization/roleAssignments?api-version=2020-10-01-preview' | jq -r '.value[] | select(.properties.principalType == "User") | {name, principalId: .properties.principalId, principalType: .properties.principalType, roleDefinitionId: (.properties.roleDefinitionId | split("/") | last)} | @json' | sed '$!s/$/,/' >> json/ra.json && echo "]" >> json/ra.json
az rest --method get --header "Accept=application/json" -u 'https://management.azure.com/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsauto1/providers/Microsoft.Authorization/roleAssignments?api-version=2020-10-01-preview' | jq -r '[.value[] | select(.properties.principalType == "User") | {name, principalId: .properties.principalId, principalType: .properties.principalType, roleDefinitionId: (.properties.roleDefinitionId | split("/") | last)}]' > json/ra.json

#Role Definition
#echo "[" > json/rd.json && az role definition list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsauto1" --output json | jq -r '.[] | {roleName, description, name} | @json' | sed '$!s/$/,/' >> json/rd.json && echo "]" >> json/rd.json
az role definition list --scope "/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvComPlacementReqApiPre/providers/Microsoft.Storage/storageAccounts/advcprapigsauto1" --output json | jq -r '[.[] | {roleName, description, name}]' > json/rd.jsonq


az rest --method get --header "Accept=application/json" -u 'https://management.azure.com/subscriptions/f847a150-f350-41ea-b158-2bdd1c5514e4/resourceGroups/cannonball/providers/Microsoft.Storage/storageAccounts/advcprapigsauto1/providers/Microsoft.Authorization/roleAssignments?api-version=2020-10-01-preview' | jq -r '[.value[] | select(.properties.principalType == "User") | {name, principalId: .properties.principalId, principalType: .properties.principalType, roleDefinitionId: (.properties.roleDefinitionId | split("/") | last)}]' > json/ra.json

az storage account list --subscription ca5362b0-62c7-461e-9be3-44f1dcec4b46 --resource-group AdvAdsEpisodesMgrApiPre --output table

subscriptions/f847a150-f350-41ea-b158-2bdd1c5514e4/resourceGroups/cannonball/providers/Microsoft.Storage/storageAccounts/advcprapigsauto1/providers/Microsoft.Authorization/roleAssignments?api-version=2020-10-01-preview' | jq -r '[.value[] | select(.properties.principalType == "User") | {name, principalId: .properties.principalId, principalType: .properties.principalType, roleDefinitionId: (.properties.roleDefinitionId | split("/") | last)}]' > json/ra.json

subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/cloud-shell-storage-southcentralus/providers/Microsoft.Storage/storageAccounts/cs7100320008e48fe17

az rest --method get --header "Accept=application/json" -u 'https://management.azure.com/subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/cloud-shell-storage-southcentralus/providers/Microsoft.Storage/storageAccounts/cs7100320008e48fe17
/providers/Microsoft.Authorization/roleAssignments?api-version=2020-10-01-preview' | jq -r '[.value[] | select(.properties.principalType == "User") | {name, principalId: .properties.principalId, principalType: .properties.principalType, roleDefinitionId: (.properties.roleDefinitionId | split("/") | last)}]' > json/ra.json
#https://chat.openai.com/share/3f97b023-96bb-4ada-a079-a62b4811a3ca
resource_url="subscriptions/ca5362b0-62c7-461e-9be3-44f1dcec4b46/resourceGroups/AdvAdsEpisodesMgrApiPre/providers/Microsoft.Storage/storageAccounts/advaemapigsauto1"
#Role Assignment
az rest --method get --header "Accept=application/json" -u "https://management.azure.com/$resource_url/providers/Microsoft.Authorization/roleAssignments?api-version=2020-10-01-preview" | jq -r '[.value[] | {name, principalId: .properties.principalId, principalType: .properties.principalType, roleDefinitionId: (.properties.roleDefinitionId | split("/") | last)}]' > json/ra.json

#Role Definition
az role definition list --scope "/$resource_url" --output json | jq -r '[.[] | {roleName, description, name}]' > json/rd.json


#USER, GROUP, SERVICE PRINCIPALS, MANAGED IDENTITY
az ad group show --group 47bf1a56-de7a-4a0e-84ed-5e07b6e09d27 --output json | jq -r '{displayName}'
az ad user show --id 8312dcee-9c4b-4bfe-8402-3afeb1317443 --output json | jq -r '{displayName}'