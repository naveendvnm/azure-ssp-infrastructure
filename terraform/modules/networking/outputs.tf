output "vnet_id" {
  description = "Resource ID of the Virtual Network."
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Name of the Virtual Network."
  value       = azurerm_virtual_network.this.name
}

output "application_subnet_id" {
  description = "Resource ID of the application subnet."
  value       = azurerm_subnet.application.id
}

output "application_subnet_name" {
  description = "Name of the application subnet."
  value       = azurerm_subnet.application.name
}

output "private_endpoint_subnet_id" {
  description = "Resource ID of the Private Endpoint subnet."
  value       = azurerm_subnet.private_endpoint.id
}

output "private_endpoint_subnet_name" {
  description = "Name of the Private Endpoint subnet."
  value       = azurerm_subnet.private_endpoint.name
}

output "application_nsg_id" {
  description = "Resource ID of the application subnet Network Security Group."
  value       = azurerm_network_security_group.application.id
}

output "private_endpoint_nsg_id" {
  description = "Resource ID of the private endpoint subnet Network Security Group."
  value       = azurerm_network_security_group.private_endpoint.id
}