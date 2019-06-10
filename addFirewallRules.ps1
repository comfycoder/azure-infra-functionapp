$VNET_RG_NAME = "RG-BS-Networking"
Write-Verbose "VNET_RG_NAME: $VNET_RG_NAME" -Verbose

$VNET_NAME = "VNet-BS-EA2-NP1-MyApps"
Write-Verbose "VNET_NAME: $VNET_NAME" -Verbose

$SUBNET_NAME = "bumbershoot-private-subnet"
Write-Verbose "SUBNET_NAME: $SUBNET_NAME" -Verbose

# $AGWAF_IP_ADDRESS = ""
# Write-Verbose "AGWAF_IP_ADDRESS: $AGWAF_IP_ADDRESS" -Verbose

# Create a rule to allow access for a subnet.
az storage account network-rule add `
--account-name "$SA_NAME" `
--resource-group "$FA_RG_NAME" `
--vnet "$VNET_NAME" `
--subnet "$SUBNET_NAME"

# #Create a rule to allow a specific address-range.
# az storage account network-rule add `
# --account-name "$SA_NAME" `
# --resource-group "$FA_RG_NAME" `
# --ip-address "$AGWAF_IP_ADDRESS"
