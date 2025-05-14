# Virtual network outputs

output "vnet_id" {
  description = "Virtual Network IDs"
  value       = azurerm_virtual_network.this.id
}


# Subnet ids

output "subnet_nginx_id" {
  description = "Sub Network  Nginx ID"
  value       = azurerm_subnet.nginx_subnet.id
}


output "subnet_vmss_id" {
  description = "Sub Network Jenkins ID"
  value       = azurerm_subnet.vmss_subnet.id
}

# Public ip outputs

output "public_ip_id" {
  description = "The ID of the public IP address."
  value       = azurerm_public_ip.this.id
}


# DNS

output "app_gateway_dns_name" {
  value = azurerm_public_ip.this.fqdn
}