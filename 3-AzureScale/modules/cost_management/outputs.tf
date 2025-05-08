output "budget_id" {
  description = "The ID of the cost management budget"
  value       = azurerm_consumption_budget_subscription.this.id
}