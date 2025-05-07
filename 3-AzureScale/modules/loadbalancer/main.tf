# Creating the loadbalancer

resource "azurerm_lb" "this" {
  name                = "${var.resource_group_name}-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "${var.resource_group_name}-frontend-ip"
    public_ip_address_id = var.public_ip_id
  }
  tags = {
    environment = "dev"
    project     = "AzureScale"
  }
}



# Creating Backend pools to the Load balancer

resource "azurerm_lb_backend_address_pool" "this" {
  name                = "${var.resource_group_name}-backendpool"
  loadbalancer_id     = azurerm_lb.this.id
}

# Creating Health Probes
resource "azurerm_lb_probe" "this" {
  name                            = "${var.resource_group_name}-http-probe"
  loadbalancer_id                 = azurerm_lb.this.id
  protocol                        = "Http"
  port                            = 80
  request_path                    = "/health"  # HTTP path to check (app needs to respond to this)
  interval_in_seconds             = 15  # How often to check
}

# Create the Load balancer rule
resource "azurerm_lb_rule" "http" {
  name                            = "${var.resource_group_name}-http-rule"
  loadbalancer_id                 = azurerm_lb.this.id
  frontend_ip_configuration_name = "${var.resource_group_name}-frontend-ip" # Name of the frontend IP configuration
  protocol                        = "Tcp"
  frontend_port                   = 80   # The port the load balancer will listen to on the frontend
  backend_port                    = 80   # The port to which traffic will be forwarded on the backend
  probe_id                         = azurerm_lb_probe.this.id  # The health probe ID
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.this.id]
}