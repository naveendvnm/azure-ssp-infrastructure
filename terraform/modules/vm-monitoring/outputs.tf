output "data_collection_rule_id" {
  description = "Resource ID of the Linux VM Data Collection Rule."
  value       = azurerm_monitor_data_collection_rule.linux_vm.id
}

output "data_collection_rule_name" {
  description = "Name of the Linux VM Data Collection Rule."
  value       = azurerm_monitor_data_collection_rule.linux_vm.name
}

output "azure_monitor_agent_id" {
  description = "Resource ID of the Azure Monitor Agent extension."
  value       = azurerm_virtual_machine_extension.azure_monitor_agent.id
}

output "dcr_association_id" {
  description = "Resource ID of the DCR association."
  value       = azurerm_monitor_data_collection_rule_association.linux_vm.id
}