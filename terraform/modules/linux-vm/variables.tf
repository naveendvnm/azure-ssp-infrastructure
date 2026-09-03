variable "resource_group_name" {
  description = "Resource group where the Linux VM will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the Linux VM."
  type        = string
}

variable "vm_name" {
  description = "Name of the Linux virtual machine."
  type        = string
}

variable "vm_size" {
  description = "Azure VM SKU."
  type        = string
  default     = "Standard_D2s_v7"
}

variable "subnet_id" {
  description = "Subnet ID where the VM network interface will be attached."
  type        = string
}

variable "admin_username" {
  description = "Linux administrator username."
  type        = string
  default     = "azureadmin"
}

variable "ssh_public_key" {
  description = "SSH public key used to access the Linux VM."
  type        = string
  sensitive   = true
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB."
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags applied to the Linux VM resources."
  type        = map(string)
  default     = {}
}