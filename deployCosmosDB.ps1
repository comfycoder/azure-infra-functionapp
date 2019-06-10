# Create the Azure Resource Group for Cosmos DB
Write-Verbose "Deploying Resource Group for Cosmos DB..." -Verbose
az group create `
--name "$COS_RG_NAME" `
--location "$COS_LOCATION"
Write-Verbose "Resource Group deployed" -Verbose

# Create Azure Cosmos DB resource
Write-Verbose "Deploying Cosmos DB resource..." -Verbose
az cosmosdb create `
--name "$COS_NAME" `
--resource-group "$COS_RG_NAME"
Write-Verbose "Cosmos DB resource deployed" -Verbose
