locals {
  resource_group_name = var.resource_group_name != "" ? var.resource_group_name : "${var.project_name}-${var.environment}-rg"

  vnet_name = "${var.project_name}-${var.environment}-vnet"
}

module "resource_group" {
  source = "../../modules/resource-group"

  name     = local.resource_group_name
  location = var.location
  tags     = var.tags
}

module "networking" {
  source = "../../modules/networking"

  name                = local.vnet_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  address_space = var.vnet_address_space

  application_subnet_address_prefix = var.application_subnet_address_prefix

  private_endpoint_subnet_address_prefix = var.private_endpoint_subnet_address_prefix

  tags = var.tags
}

module "private_dns" {
  source = "../../modules/private-dns"

  resource_group_name = module.resource_group.name
  virtual_network_id  = module.networking.vnet_id

  zone_names = [
    "privatelink.blob.core.windows.net",
    "privatelink.vaultcore.azure.net"
  ]

  tags = var.tags
}

module "storage" {
  source = "../../modules/storage"

  name = var.storage_account_name

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  tags = var.tags
}

module "storage_private_endpoint" {
  source = "../../modules/private-endpoint"

  name                = "pe-${var.storage_account_name}"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  subnet_id = module.networking.private_endpoint_subnet_id

  private_connection_resource_id = module.storage.id

  subresource_names = [
    "blob"
  ]

  private_dns_zone_ids = [
    module.private_dns.zone_ids["privatelink.blob.core.windows.net"]
  ]

  tags = var.tags
}

module "key_vault" {
  source = "../../modules/key-vault"

  name = var.key_vault_name

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  tenant_id = data.azurerm_client_config.current.tenant_id

  tags = var.tags
}

module "key_vault_private_endpoint" {
  source = "../../modules/private-endpoint"

  name                = "pe-${var.key_vault_name}"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  subnet_id = module.networking.private_endpoint_subnet_id

  private_connection_resource_id = module.key_vault.id

  subresource_names = [
    "vault"
  ]

  private_dns_zone_ids = [
    module.private_dns.zone_ids["privatelink.vaultcore.azure.net"]
  ]

  tags = var.tags
}

module "linux_vm" {
  source = "../../modules/linux-vm"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  vm_name        = "azure-ssp-nonprod-vm"
  vm_size        = "Standard_D2s_v7"
  subnet_id      = module.networking.application_subnet_id
  admin_username = "azureadmin"
  ssh_public_key = var.ssh_public_key

  tags = var.tags
}

module "monitoring" {
  source = "../../modules/monitoring"

  name                = "azssp-law-nprd"
  resource_group_name = module.resource_group.name
  location            = var.location
  retention_in_days   = 30

  tags = var.tags
}

module "vm_monitoring" {
  source = "../../modules/vm-monitoring"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  workspace_id   = module.monitoring.workspace_id
  workspace_name = module.monitoring.workspace_name

  vm_id = module.linux_vm.vm_id

  tags = var.tags

  depends_on = [
    module.monitoring,
    module.linux_vm
  ]
}

