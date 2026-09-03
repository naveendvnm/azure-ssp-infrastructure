variable "name" {
  description = "Name of the Virtual Network."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "Virtual Network name must not be empty."
  }
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group containing the Virtual Network."
  type        = string
}

variable "address_space" {
  description = "Address space for the Virtual Network."
  type        = list(string)

  validation {
    condition     = length(var.address_space) > 0
    error_message = "At least one VNet address space must be provided."
  }
}

variable "application_subnet_name" {
  description = "Application subnet name."
  type        = string
  default     = "snet-application"
}

variable "application_subnet_address_prefix" {
  description = "CIDR address prefix for the application subnet."
  type        = string
}

variable "private_endpoint_subnet_name" {
  description = "Private Endpoint subnet name."
  type        = string
  default     = "snet-private-endpoints"
}

variable "private_endpoint_subnet_address_prefix" {
  description = "CIDR address prefix for the Private Endpoint subnet."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Virtual Network."
  type        = map(string)
  default     = {}
}