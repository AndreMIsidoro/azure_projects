variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location for the resources"
  type        = string
}

variable "subnet_vmss_id" {
  description = "Subnet for jenkins and nextcloud vmss id"
  type        = string
}

variable "enable_debug" {
  description = "Enable debug resources"
  type        = bool
  default     = false
}
