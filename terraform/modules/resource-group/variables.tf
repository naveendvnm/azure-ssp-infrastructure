variable "name" {
  description = "Name of the Azure Resource Group."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "Resource group name must not be empty."
  }
}

variable "location" {
  description = "Azure region where the Resource Group will be created."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "Azure location must not be empty."
  }
}

variable "tags" {
  description = "Tags to apply to the Resource Group."
  type        = map(string)
  default     = {}
}