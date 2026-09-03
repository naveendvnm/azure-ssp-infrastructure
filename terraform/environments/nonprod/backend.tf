# Phase 0 placeholder.
# Remote Azure Storage backend configuration will be enabled once the
# client's state-storage subscription, resource group, storage account,
# container and access model are confirmed.
#
# Example production pattern:
#
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "..."
#     storage_account_name = "..."
#     container_name       = "tfstate"
#     key                  = "azure-ssp/nonprod.tfstate"
#   }
# }
