output "id" {
  description = "Private Endpoint resource ID."
  value       = azurerm_private_endpoint.this.id
}

output "name" {
  description = "Private Endpoint name."
  value       = azurerm_private_endpoint.this.name
}

output "private_ip_address" {
  description = "Private IP address assigned to the Private Endpoint."
  value       = azurerm_private_endpoint.this.private_service_connection[0].private_ip_address
}