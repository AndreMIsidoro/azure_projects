output "private_ip_nginx" {
  description = "Private ip of nginx"
  value       = azurerm_network_interface.nginx.private_ip_address
}
