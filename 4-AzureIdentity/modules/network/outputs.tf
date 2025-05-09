# Virtual network outputs

output "vnet_id" {
  description = "Virtual Network IDs"
  value       = azurerm_virtual_network.this.id
}