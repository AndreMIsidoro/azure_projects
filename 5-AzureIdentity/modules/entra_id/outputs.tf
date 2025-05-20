output "client_id" {
  value = azuread_application.java_spa.client_id
}

output "tenant_id" {
  value = data.azurerm_client_config.current.tenant_id
}

output "redirect_uri" {
    value = join(",", azuread_application.java_spa.web[0].redirect_uris)
}
