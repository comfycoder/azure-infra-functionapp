# NOTE: Must first be logged into Azure and set the target subscription

#*******************************************************
# Function App Variables
#*******************************************************

# Name of the Azure Resource Group
$FA_RG_NAME = $(If ($env:FA_RG_NAME) { "$env:FA_RG_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'FA_RG_NAME'" -ErrorAction Stop }) 
Write-Verbose "FA_RG_NAME: $FA_RG_NAME" -Verbose

# Name of the Azure Function App resource
$FA_NAME = $(If ($env:FA_NAME) { "$env:FA_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'FA_NAME'" -ErrorAction Stop }) 
Write-Verbose "FA_NAME: $FA_NAME" -Verbose

# Name of the Azure Region in which to deploy these resources
$FA_LOCATION = $(If ($env:FA_LOCATION) { "$env:FA_LOCATION" } Else { "eastus2" }) 
Write-Verbose "FA_LOCATION: $FA_LOCATION" -Verbose

# OS of the Azure Function App resource
$FA_OS = $(If ($env:FA_OS) { "$env:FA_OS" } Else { "Windows" })
Write-Verbose "FA_OS: $FA_OS" -Verbose

# Name of the Azure Function App resource
$FA_RUNTIME = $(If ($env:FA_RUNTIME) { "$env:FA_RUNTIME" } Else { "dotnet" })
Write-Verbose "FA_RUNTIME: $FA_RUNTIME" -Verbose

# Type of Azure App Service Plan resource to create
$FA_PLAN_TYPE = $(If ($env:FA_PLAN_TYPE) { "$env:FA_PLAN_TYPE" } Else { "ASP" })
Write-Verbose "FA_PLAN_TYPE: $FA_PLAN_TYPE" -Verbose

#*******************************************************
# Storage Account Variables
#*******************************************************

# Name of the Azure Storage Account resource
$SA_NAME = $(If ($env:SA_NAME) { "$env:SA_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'SA_NAME'" -ErrorAction Stop }) 
Write-Verbose "SA_NAME: $SA_NAME" -Verbose

#*******************************************************
# App Insights Variables
#*******************************************************

# Name of the Azure Application Insights resource
$AIS_NAME = $(If ($env:AIS_NAME) { "$env:AIS_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'AIS_NAME'" -ErrorAction Stop }) 
Write-Verbose "AIS_NAME: $AIS_NAME" -Verbose

#*******************************************************
# App Service Plan Variables
#*******************************************************

# Name of the Azure App Service Plan resource
$ASP_NAME = $(If ($env:ASP_NAME) { "$env:ASP_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'ASP_NAME'" -ErrorAction Stop }) 
Write-Verbose "ASP_NAME: $ASP_NAME" -Verbose

# Sku of the Azure Function App resoure to deploy
$ASP_SKU = $(If ($env:ASP_SKU) { "$env:ASP_SKU" } Else { "S1" })
Write-Verbose "ASP_SKU: $ASP_SKU" -Verbose

#*******************************************************
# Cosmos DB Variables
#*******************************************************

# Name of the Azure Cosmos DB Account resource group
$COS_RG_NAME = $(If ($env:COS_RG_NAME) { "$env:COS_RG_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'COS_RG_NAME'" -ErrorAction Stop }) 
Write-Verbose "COS_RG_NAME: $COS_RG_NAME" -Verbose

# Name of the Azure Cosmos DB Account resource
$COS_NAME = $(If ($env:COS_NAME) { "$env:COS_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'COS_NAME'" -ErrorAction Stop }) 
Write-Verbose "COS_NAME: $COS_NAME" -Verbose

# Name of the Azure Region in which to deploy these resources
$COS_LOCATION = $(If ($env:COS_LOCATION) { "$env:COS_LOCATION" } Else { $FA_LOCATION })
Write-Verbose "COS_LOCATION: $COS_LOCATION" -Verbose

#*******************************************************
# SignalR Variables
#*******************************************************

# Name of the Azure Resource Group
$SIGR_RG_NAME = $(If ($env:SIGR_RG_NAME) { "$env:SIGR_RG_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'SIGR_RG_NAME'" -ErrorAction Stop }) 
Write-Verbose "SIGR_RG_NAME: $SIGR_RG_NAME" -Verbose

# Name of the Azure SignalR resource
$SIGR_NAME = $(If ($env:SIGR_RG_NAME) { "$env:SIGR_NAME" } Else { Write-Error -Message "ERROR: Missing value for 'SIGR_NAME'" -ErrorAction Stop }) 
Write-Verbose "SIGR_NAME: $SIGR_NAME" -Verbose

$SIGR_LOCATION = $(If ($env:SIGR_LOCATION) { "$env:SIGR_LOCATION" } Else { $FA_LOCATION })
Write-Verbose "SIGR_LOCATION: $SIGR_LOCATION" -Verbose

# Sku of the Azure SignalR resoure to deploy
$SIGR_SKU = $(If ($env:SIGR_SKU) { "$env:SIGR_SKU" } Else { "Free_DS2" })
Write-Verbose "SIGR_SKU: $SIGR_SKU" -Verbose

# Number of units for the Azure SignalR resource
$SIGR_UNIT_COUNT = $(If ($env:SIGR_UNIT_COUNT) { "$env:SIGR_UNIT_COUNT" } Else { 1 })
Write-Verbose "SIGR_UNIT_COUNT: $SIGR_UNIT_COUNT" -Verbose