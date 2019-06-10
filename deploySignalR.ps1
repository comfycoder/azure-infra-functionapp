# Create the Azure Resource Group for Cosmos DB
Write-Verbose "Deploying Resource Group for Cosmos DB..." -Verbose
az group create `
--name "$SIGR_RG_NAME" `
--location "$SIGR_LOCATION"
Write-Verbose "Resource Group deployed" -Verbose

# Create Azure SignalR resource
Write-Verbose "Deploying SignalR resource..." -Verbose

$SIGR_TEMPLATE_FILE = (Join-Path $SCRIPT_DIRECTORY "deploySignalR.json")
Write-Verbose "SIGR_TEMPLATE_FILE: $SIGR_TEMPLATE_FILE" -Verbose

$DEPLOYMENT_NAME = "deploySignalR-$(get-date -f yyyyMMddHHmmss)"

az group deployment create `
    -g "$SIGR_RG_NAME" `
    -n "$DEPLOYMENT_NAME" `
    --template-file "$SIGR_TEMPLATE_FILE" `
    --parameters "name=$SIGR_NAME" `
                 "location=$SIGR_LOCATION" 

Write-Verbose "SignalR resource deployed" -Verbose
