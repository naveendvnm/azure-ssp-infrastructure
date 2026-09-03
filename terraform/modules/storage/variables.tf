variable "name" {
  description = "Globally unique Storage Account name."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.name))
    error_message = "Storage Account name must be 3-24 characters, lowercase letters and numbers only."
  }
}

variable "resource_group_name" {
  description = "Resource Group containing the Storage Account."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "account_tier" {
  description = "Storage Account performance tier."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "account_tier must be Standard or Premium."
  }
}

variable "account_replication_type" {
  description = "Storage replication strategy."
  type        = string
  default     = "LRS"

  validation {
    condition = contains(
      ["LRS", "ZRS", "GRS", "GZRS", "RAGRS", "RAGZRS"],
      var.account_replication_type
    )

    error_message = "Invalid Storage Account replication type."
  }
}

variable "tags" {
  description = "Tags applied to the Storage Account."
  type        = map(string)
  default     = {}
}