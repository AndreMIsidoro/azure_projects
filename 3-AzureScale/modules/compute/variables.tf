variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet for VMSS deployment"
}

variable "admin_username" {
  type        = string
  description = "Admin username for VM instances"
}

variable "admin_password" {
  type        = string
  description = "Admin password for VM instances"
  sensitive   = true
}

variable "vmss_name" {
  type        = string
  description = "Name of the Virtual Machine Scale Set"
}

variable "instance_count" {
  type        = number
  description = "Number of VM instances"
  default     = 2
}
variable "ssh_public_key_path" {
  description = "The path to the SSH public key"
  type        = string
}