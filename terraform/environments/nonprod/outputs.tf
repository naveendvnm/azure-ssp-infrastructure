output "resource_group_name" {
  description = "Name of the Resource Group."
  value       = module.resource_group.name
}

output "resource_group_id" {
  description = "Resource ID of the Resource Group."
  value       = module.resource_group.id
}

output "location" {
  description = "Azure deployment location."
  value       = module.resource_group.location
}

output "vnet_name" {
  description = "Name of the non-prod Virtual Network."
  value       = module.networking.vnet_name
}

output "vnet_id" {
  description = "Resource ID of the non-prod Virtual Network."
  value       = module.networking.vnet_id
}

output "application_subnet_id" {
  description = "Resource ID of the application subnet."
  value       = module.networking.application_subnet_id
}

output "private_endpoint_subnet_id" {
  description = "Resource ID of the Private Endpoint subnet."
  value       = module.networking.private_endpoint_subnet_id
}

output "application_nsg_id" {
  description = "Resource ID of the application Network Security Group."
  value       = module.networking.application_nsg_id
}

output "private_endpoint_nsg_id" {
  description = "Resource ID of the private endpoint Network Security Group."
  value       = module.networking.private_endpoint_nsg_id
}

output "private_dns_zone_names" {
  description = "Private DNS zones configured for the non-production environment."
  value       = module.private_dns.zone_names
}

output "private_dns_zone_ids" {
  description = "Private DNS zone resource IDs."
  value       = module.private_dns.zone_ids
}

output "storage_account_id" {
  description = "Storage Account resource ID."
  value       = module.storage.id
}

output "storage_account_name" {
  description = "Storage Account name."
  value       = module.storage.name
}

output "storage_primary_blob_endpoint" {
  description = "Primary Blob endpoint."
  value       = module.storage.primary_blob_endpoint
}

output "storage_private_endpoint_id" {
  description = "Storage Private Endpoint resource ID."
  value       = module.storage_private_endpoint.id
}

output "storage_private_endpoint_ip" {
  description = "Private IP assigned to the Storage Private Endpoint."
  value       = module.storage_private_endpoint.private_ip_address
}

output "key_vault_id" {
  description = "Key Vault resource ID."
  value       = module.key_vault.id
}

output "key_vault_name" {
  description = "Key Vault name."
  value       = module.key_vault.name
}

output "key_vault_uri" {
  description = "Key Vault URI."
  value       = module.key_vault.vault_uri
}

output "key_vault_private_endpoint_id" {
  description = "Key Vault Private Endpoint resource ID."
  value       = module.key_vault_private_endpoint.id
}

output "key_vault_private_endpoint_ip" {
  description = "Key Vault Private Endpoint private IP."
  value       = module.key_vault_private_endpoint.private_ip_address
}

output "log_analytics_workspace_id" {
  description = "Resource ID of the Log Analytics workspace."
  value       = module.monitoring.workspace_id
}

output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  value       = module.monitoring.workspace_name
}

