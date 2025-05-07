# Virtual network outputs

output "vnet_id" {
  description = "Virtual Network IDs"
  value       = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  description = "Subnet IDs for public subnet"
  value = {
    for s in azurerm_subnet.subnets :
    s.name => s.id
  }
}

# Public ip outputs

output "public_ip_id" {
  description = "The ID of the public IP address."
  value       = azurerm_public_ip.this.id
}

output "public_ip_address" {
  description = "The actual public IP address assigned."
  value       = azurerm_public_ip.this.ip_address
}

# NSGs ids

output "nsg_ids" {
  value       = { for k, v in azurerm_network_security_group.this : k => v.id }
  description = "Map of NSG names to IDs"
}