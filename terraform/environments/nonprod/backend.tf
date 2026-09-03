terraform {
  backend "azurerm" {
    resource_group_name  = "azure-ssp-tfstate-rg"
    storage_account_name = "azssptfstate20260903"
    container_name       = "tfstate"
    key                  = "azure-ssp/nonprod.tfstate"

    use_azuread_auth = true
  }
}