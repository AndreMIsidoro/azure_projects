variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location for the resources"
  type        = string
}

variable "public_ip_id" {
  description = "The ID of the public IP address."
  type        = string
}