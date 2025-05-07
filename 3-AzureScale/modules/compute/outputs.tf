output "vmss_id" {
  description = "ID of the Virtual Machine Scale Set"
  value       = azurerm_linux_virtual_machine_scale_set.this.id
}

output "vmss_name" {
  description = "Name of the VMSS"
  value       = azurerm_linux_virtual_machine_scale_set.this.name
}