variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location for the resources"
  type        = string
}

variable "vnet_name" {
  type        = string
  description = "Virtual Network name"
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

variable "nsg_rules" {
  description = "Map of subnet name to allowed inbound port"
  type = map(object({
    name       = string
    port       = number
    priority   = number
    direction  = string
    access     = string
    protocol   = string
  }))
  default = {
    WebSubnet = {
      name      = "AllowHTTP"
      port      = 80
      priority  = 100
      direction = "Inbound"
      access    = "Allow"
      protocol  = "Tcp"
    }
    AppSubnet = {
      name      = "AllowSSH"
      port      = 22
      priority  = 110
      direction = "Inbound"
      access    = "Allow"
      protocol  = "Tcp"
    }
  }
}