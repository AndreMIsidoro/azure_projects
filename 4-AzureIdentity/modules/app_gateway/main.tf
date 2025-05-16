# Creating Application Gateway

resource "azurerm_application_gateway" "this" {
  name                = "${var.resource_group_name}-appgw"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = "Standard_v2"   # Choose WAF_v2 later if needed
    tier     = "Standard_v2"
    capacity = 1               # Autoscaling can be configured later
  }

  gateway_ip_configuration {
    name      = "appgw-ip-config"
    subnet_id = var.subnet_appgw_id
  }

  frontend_port {
    name = "frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = var.public_ip_appgw
  }

  backend_address_pool {
    name = "default-backend-pool"
    ip_addresses = [var.private_ip_nginx]
  }

  backend_http_settings {
    name                  = "default-http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = "http-listener"
    frontend_ip_configuration_name = "frontend-ip"
    frontend_port_name             = "frontend-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "default-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "http-listener"
    backend_address_pool_name  = "default-backend-pool"
    backend_http_settings_name = "default-http-settings"
    priority                   = 100
  }

  probe {
    name = "nginx-probe"
    protocol = "Http"
    path = "/"
    interval = 30
    timeout = 30
    unhealthy_threshold = 3
    pick_host_name_from_backend_http_settings = true
    match {
      status_code = ["200-399"]
    }
  }

  tags = {
    environment = "development"
  }
}