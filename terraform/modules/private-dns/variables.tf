variable "zone_names" {
  description = "List of Private DNS zones to create."
  type        = list(string)

  validation {
    condition     = length(var.zone_names) > 0
    error_message = "At least one Private DNS zone must be provided."
  }
}

variable "resource_group_name" {
  description = "Resource Group containing the Private DNS zones."
  type        = string
}

variable "virtual_network_id" {
  description = "Virtual Network ID to associate with the Private DNS zones."
  type        = string
}

variable "tags" {
  description = "Tags to apply to Private DNS resources."
  type        = map(string)
  default     = {}
}