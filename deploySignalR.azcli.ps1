# Create the Azure Resource Group for Cosmos DB
Write-Verbose "Deploying Resource Group for Cosmos DB..." -Verbose
az group create `
--name "$SIGR_RG_NAME" `
--location "$SIGR_LOCATION"
Write-Verbose "Resource Group deployed" -Verbose

# Create Azure SignalR resource
Write-Verbose "Deploying SignalR resource..." -Verbose
az signalr create `
--name "$SIGR_NAME" `
--resource-group "$SIGR_RG_NAME" `
--sku "$SIGR_SKU" `
--unit-count $SIGR_UNIT_COUNT
Write-Verbose "SignalR resource deployed" -Verbose
