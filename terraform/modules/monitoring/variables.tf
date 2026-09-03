variable "name" {
  description = "Name of the Log Analytics workspace."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the monitoring resources."
  type        = string
}

variable "location" {
  description = "Azure region for the monitoring resources."
  type        = string
}

variable "retention_in_days" {
  description = "Log Analytics retention period."
  type        = number
  default     = 30

  validation {
    condition     = var.retention_in_days >= 30 && var.retention_in_days <= 730
    error_message = "Retention must be between 30 and 730 days."
  }
}

variable "tags" {
  description = "Tags to apply to monitoring resources."
  type        = map(string)
  default     = {}
}