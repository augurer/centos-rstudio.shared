# Change these four parameters as needed
$ACI_PERS_RESOURCE_GROUP="afc-dev"
$ACI_PERS_STORAGE_ACCOUNT_NAME="afcdevstgrstudio"
$ACI_PERS_LOCATION="eastus2"
$ACI_PERS_SHARE_NAME="cranrepo"

# Create the storage account with the parameters
az storage account create `
    --resource-group $ACI_PERS_RESOURCE_GROUP `
    --name $ACI_PERS_STORAGE_ACCOUNT_NAME `
    --location $ACI_PERS_LOCATION `
    --sku Standard_LRS

# Create the file share
az.cmd storage share create --name $ACI_PERS_SHARE_NAME --account-name $ACI_PERS_STORAGE_ACCOUNT_NAME