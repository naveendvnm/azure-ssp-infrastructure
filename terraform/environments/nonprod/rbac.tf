resource "azurerm_role_assignment" "vm_key_vault_secrets_user" {
  scope                = module.key_vault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = module.linux_vm.principal_id
}