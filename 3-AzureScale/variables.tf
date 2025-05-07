variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Nerwork name"
  type = string
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the VNet"
}

variable "subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
  description = "List of subnets"
}

variable "ssh_public_key_path" {
  description = "The path to the SSH public key to be used for authentication"
  type        = string
}