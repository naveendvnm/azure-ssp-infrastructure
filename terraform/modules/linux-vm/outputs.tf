output "vm_id" {
  description = "ID of the Linux virtual machine."
  value       = azurerm_linux_virtual_machine.this.id
}

output "vm_name" {
  description = "Name of the Linux virtual machine."
  value       = azurerm_linux_virtual_machine.this.name
}

output "private_ip_address" {
  description = "Private IP address assigned to the Linux VM."
  value       = azurerm_network_interface.this.private_ip_address
}

output "network_interface_id" {
  description = "Network interface ID."
  value       = azurerm_network_interface.this.id
}

output "principal_id" {
  description = "System-assigned managed identity principal ID."
  value       = azurerm_linux_virtual_machine.this.identity[0].principal_id
}