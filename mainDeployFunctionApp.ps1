#**********************************************************
# Get PowerSchell Script Execution Path
#**********************************************************

# Get the directory where the main script is executing
$SCRIPT_DIRECTORY = $PSScriptRoot
Write-Verbose "Script Directory: $SCRIPT_DIRECTORY" -Verbose

#**********************************************************
# Get Azure Devops RM Service Principal Variables
#**********************************************************

# Get the Tenant Id in which the Subscription exists
$TENANT_ID = $(az account show --query tenantId -o tsv)
Write-Verbose "TENANT_ID: $TENANT_ID" -Verbose

# Get the Account Subscription Id
$SUBSCRIPTION_ID = $(az account show --query id -o tsv)
Write-Verbose "SUBSCRIPTION_ID: $SUBSCRIPTION_ID" -Verbose

# Get the Subscription Name
$SUBSCRIPTION_NAME = $(az account show --query name -o tsv)
Write-Verbose "SUBSCRIPTION_NAME: $SUBSCRIPTION_NAME" -Verbose

# Get the name of the user who launched this script
$USER_NAME = $(az account show --query user.name -o tsv)
Write-Verbose "User Name: $USER_NAME" -Verbose

#**********************************************************
# Get Azure DevOps Release Pipeline Variables
#**********************************************************

#. (Join-Path $SCRIPT_DIRECTORY "azure-utilities.ps1")

. (Join-Path $SCRIPT_DIRECTORY "variables.ps1")

#**********************************************************
# Add Azure CLI Extensions
#**********************************************************

az extension add -n application-insights

#**********************************************************
# Deploy infrastructure
#**********************************************************

Write-Verbose "Deploying Function App resources..." -Verbose

. (Join-Path $SCRIPT_DIRECTORY "deployFunctionAppResources.ps1")

Write-Verbose "Function App resources deployed." -Verbose


Write-Verbose "Deploying Cosmos DB resource..." -Verbose

. (Join-Path $SCRIPT_DIRECTORY "deployCosmosDB.ps1")

Write-Verbose "Cosmos DB resource deployed." -Verbose


Write-Verbose "Deploying SignalR resource..." -Verbose

. (Join-Path $SCRIPT_DIRECTORY "deploySignalR.ps1")

Write-Verbose "SignalR resource deployed." -Verbose


Write-Verbose "Retrieving resource connection strings and keys..." -Verbose

. (Join-Path $SCRIPT_DIRECTORY "getConnectionSettings.ps1")

Write-Verbose "Resource connection strings and keys retrieved." -Verbose

