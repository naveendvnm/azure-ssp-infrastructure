variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "nonprod"
}

variable "location" {
  description = "Azure region for the deployment."
  type        = string
  default     = "eastus"
}

variable "project_name" {
  description = "Logical project/application name used for resource naming."
  type        = string
  default     = "azure-ssp"
}

variable "resource_group_name" {
  description = "Resource group name. Leave empty to derive it from project and environment."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Common resource tags."
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
    Project   = "Azure-SSP"
  }
}

variable "vnet_address_space" {
  description = "Address space for the non-prod Virtual Network."
  type        = list(string)

  default = [
    "10.20.0.0/16"
  ]
}

variable "application_subnet_address_prefix" {
  description = "CIDR range for the application subnet."
  type        = string
  default     = "10.20.1.0/24"
}

variable "private_endpoint_subnet_address_prefix" {
  description = "CIDR range for the Private Endpoint subnet."
  type        = string
  default     = "10.20.2.0/24"
}

variable "private_dns_zone_names" {
  description = "Private DNS zones required by the non-production environment."
  type        = list(string)

  default = [
    "privatelink.blob.core.windows.net"
  ]
}

variable "storage_account_name" {
  description = "Globally unique Storage Account name for the non-production environment."
  type        = string
}

variable "storage_account_tier" {
  description = "Storage Account performance tier."
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Storage Account replication strategy."
  type        = string
  default     = "LRS"
}

variable "key_vault_name" {
  description = "Globally unique Key Vault name."
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key used to access the non-production Linux VM."
  type        = string
  sensitive   = true
}