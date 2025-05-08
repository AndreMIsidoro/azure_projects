#Resource connection string
output "storage_account_connection_string" {
  value = azurerm_storage_account.this.primary_connection_string
}
