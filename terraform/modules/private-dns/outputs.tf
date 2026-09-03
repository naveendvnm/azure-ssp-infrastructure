output "zone_ids" {
  description = "Map of Private DNS zone names to resource IDs."
  value = {
    for name, zone in azurerm_private_dns_zone.this :
    name => zone.id
  }
}

output "zone_names" {
  description = "Private DNS zone names."
  value       = keys(azurerm_private_dns_zone.this)
}

output "vnet_link_ids" {
  description = "Map of Private DNS zone names to VNet link IDs."
  value = {
    for name, link in azurerm_private_dns_zone_virtual_network_link.this :
    name => link.id
  }
}