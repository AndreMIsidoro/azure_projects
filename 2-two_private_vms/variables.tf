variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to create resources in"
  type        = string
}

variable "vm_count" {
  description = "The number of virtual machines to create"
  type        = number
}

variable "vm_size" {
  description = "The size of the virtual machines"
  type        = string
}

variable "ssh_public_key_path" {
  description = "The path to the SSH public key to be used for authentication"
  type        = string
}