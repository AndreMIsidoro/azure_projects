# General Variables

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}


# Network Variables

variable "vnet_name" {
  description = "Virtual Nerwork name"
  type = string
}
