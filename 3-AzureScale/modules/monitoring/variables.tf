variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location for the resources"
  type        = string
}

variable "vmss_id" {
  description = "ID of the VMSS to monitor"
  type        = string
}

variable "alert_email" {
  description = "Emain that receives alerts"
  type        = string
}