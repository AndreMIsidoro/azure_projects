# Virtual network outputs

output "vnet_name" {
  description = "Virtual Network name"
  value       = azurerm_virtual_network.this.name
}

output "subnet_id" {
  description = "Subnet ID for public subnet"
  value       = azurerm_subnet.public.id
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