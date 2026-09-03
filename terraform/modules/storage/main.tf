resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  https_traffic_only_enabled = true
  min_tls_version            = "TLS1_2"

  public_network_access_enabled = false

  allow_nested_items_to_be_public = false

  shared_access_key_enabled = true

  infrastructure_encryption_enabled = true

  blob_properties {
    versioning_enabled = true
  }

  tags = var.tags
}