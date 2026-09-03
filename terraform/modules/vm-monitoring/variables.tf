variable "resource_group_name" {
  description = "Resource group containing monitoring resources."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "workspace_id" {
  description = "Log Analytics Workspace resource ID."
  type        = string
}

variable "workspace_name" {
  description = "Log Analytics Workspace name."
  type        = string
}

variable "vm_id" {
  description = "Linux VM resource ID to monitor."
  type        = string
}

variable "tags" {
  description = "Tags applied to monitoring resources."
  type        = map(string)
  default     = {}
}