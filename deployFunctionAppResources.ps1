
# Create the Azure Resource Group
Write-Verbose "Deploying Resource Group..." -Verbose
az group create `
--name "$FA_RG_NAME" `
--location "$FA_LOCATION"
Write-Verbose "Resource Group deployed" -Verbose

# Create the Azure Application Insights resource
Write-Verbose "Deploying Application Insights resource..." -Verbose
az monitor app-insights component create `
--app "$AIS_NAME" `
--resource-group "$FA_RG_NAME" `
--location "$FA_LOCATION" `
--kind "web" `
--application-type "web"
Write-Verbose "Application Insights resource deployed" -Verbose

# Create the Azure Storge Account resource
Write-Verbose "Deploying Storge Account resource..." -Verbose
az storage account create `
--name "$SA_NAME" `
--resource-group "$FA_RG_NAME" `
--location "$FA_LOCATION" `
--kind "StorageV2" `
--sku "Standard_LRS" `
--https-only true
Write-Verbose "Storge Account resource deployed" -Verbose

if (($FA_PLAN_TYPE) -and ($FA_PLAN_TYPE -eq "ASP"))
{
    # Create Application Service Plan resource
    Write-Verbose "Deploying Application Service Plan resource..." -Verbose
    az functionapp plan create `
    --name "$ASP_NAME" `
    --resource-group "$FA_RG_NAME" `
    --location "$FA_LOCATION" `
    --sku "$ASP_SKU" 
    # --min-instances 1 
    # --max-burst 10
    Write-Verbose "Application Service Plan resource deployed" -Verbose

    # Create the Azure Function App resource
    Write-Verbose "Deploying Function App resource..." -Verbose
    az functionapp create `
    --name "$FA_NAME" `
    --resource-group "$FA_RG_NAME" `
    --plan "$ASP_NAME" `
    --storage-account "$SA_NAME" `
    --app-insights "$AIS_NAME" `
    --os-type "$FA_OS" `
    --runtime "$FA_RUNTIME"
    Write-Verbose "Function App resource deployed" -Verbose    
}
else 
{
    # Create the Azure Function App and Consumption Plan resources
    Write-Verbose "Deploying Function App and Consumption Plan resources..." -Verbose
    az functionapp create `
    --name "$FA_NAME" `
    --resource-group "$FA_RG_NAME" `
    --consumption-plan-location "$FA_LOCATION" `
    --storage-account "$SA_NAME" `
    --app-insights "$AIS_NAME" `
    --os-type "$FA_OS" `
    --runtime "$FA_RUNTIME"
    Write-Verbose "Function App and Consumption Plan resources deployed" -Verbose
}

# Apply additional Function App configuration property values
Write-Verbose "Apply additional Function App configurations..." -Verbose
az functionapp config set `
--name "$FA_NAME" `
--resource-group "$FA_RG_NAME" `
--always-on true `
--auto-heal-enabled true `
--http20-enabled true `
--min-tls-version "1.2" `
--prewarmed-instance-count 1 `
--remote-debugging-enabled false `
--use-32bit-worker-process false `
--web-sockets-enabled false 
Write-Verbose "Function App additional Function App configurations applied" -Verbose

# Update Function App Properties
Write-Verbose "Update Function App properties..." -Verbose
az functionapp update `
--name "$FA_NAME" `
--resource-group "$FA_RG_NAME" `
--set "httpsOnly=true"
Write-Verbose "Function App properties updated" -Verbose
