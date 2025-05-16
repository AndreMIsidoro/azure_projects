variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location for the resources"
  type        = string
}

variable "public_ip_appgw" {
  description = "Public Ip of app gateway"
  type        = string
}


variable "subnet_appgw_id" {
  description = "Sub Network App Gateway ID"
  type        = string
}


variable "private_ip_nginx" {
  description = "Private ip of nginx vm"
  type        = string
}