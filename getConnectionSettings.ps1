# Retrieve Storage Account Connection String
$SA_CONNECTION_STRING = $(az storage account show-connection-string `
--name "$SA_NAME" `
--resource-group "$FA_RG_NAME" `
--query "connectionString" -o tsv)
Write-Verbose "SA_CONNECTION_STRING: $SA_CONNECTION_STRING" -Verbose

# Retrieve Cosmos DB Connection String
$COS_CONNECTION_STRING = $(az cosmosdb list-connection-strings `
  --name "$COS_NAME" `
  --resource-group "$COS_RG_NAME" `
  --query "connectionStrings[?description=='Primary SQL Connection String'].connectionString" -o tsv)
Write-Verbose "COS_CONNECTION_STRING: $COS_CONNECTION_STRING" -Verbose

# Retrieve Cosmos DB Master Key
$COS_MASTER_KEY = $(az cosmosdb list-keys `
--name "$COS_NAME" `
--resource-group "$COS_RG_NAME" `
--query primaryMasterKey -o tsv)
Write-Verbose "COS_MASTER_KEY: $COS_MASTER_KEY" -Verbose

# Retrieve Signal Connection String
$SIGR_CONNECTION_STRING = $(az signalr key list `
--name "$SIGR_NAME" `
--resource-group "$FA_RG_NAME" `
--query primaryConnectionString -o tsv)
Write-Verbose "SIGR_CONNECTION_STRING: $SIGR_CONNECTION_STRING" -Verbose
