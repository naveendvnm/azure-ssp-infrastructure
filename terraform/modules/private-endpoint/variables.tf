variable "name" {
  description = "Private Endpoint name."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the Private Endpoint will be deployed."
  type        = string
}

variable "private_connection_resource_id" {
  description = "Resource ID of the Azure service."
  type        = string
}

variable "subresource_names" {
  description = "Private Link subresources."
  type        = list(string)
}

variable "private_dns_zone_ids" {
  description = "Private DNS zone IDs."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Resource tags."
  type        = map(string)
  default     = {}
}