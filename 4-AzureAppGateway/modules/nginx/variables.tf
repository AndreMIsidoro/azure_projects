variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location for the resources"
  type        = string
}

variable "subnet_nginx_id" {
  description = "Subnet nginx id"
  type        = string
}

variable "app_gateway_subnet_prefixes" {
  description = "App gateway subnet prefixes"
  type = string
}

variable "jenkins_private_ip" {
  description = "Jenkins private Ip"
  type = string
}

variable "enable_debug" {
  description = "Enable debug resources"
  type        = bool
  default     = false
}
