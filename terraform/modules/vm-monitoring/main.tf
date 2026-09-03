resource "azurerm_monitor_data_collection_rule" "linux_vm" {
  name                = "azssp-dcr-linux-vm"
  location            = var.location
  resource_group_name = var.resource_group_name

  description = "Collect Linux VM syslog data for Azure SSP monitoring."

  destinations {
    log_analytics {
      workspace_resource_id = var.workspace_id
      name                  = var.workspace_name
    }
  }

  data_flow {
    streams      = ["Microsoft-Syslog"]
    destinations = [var.workspace_name]
  }

  data_sources {
    syslog {
      name           = "linux-syslog"
      streams        = ["Microsoft-Syslog"]
      facility_names = ["auth", "authpriv", "cron", "daemon", "kern", "syslog"]
      log_levels     = ["Warning", "Error", "Critical", "Alert", "Emergency"]
    }
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor_agent" {
  name                       = "AzureMonitorLinuxAgent"
  virtual_machine_id         = var.vm_id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
}

resource "azurerm_monitor_data_collection_rule_association" "linux_vm" {
  name                    = "azssp-linux-vm-dcr-association"
  target_resource_id      = var.vm_id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.linux_vm.id
}