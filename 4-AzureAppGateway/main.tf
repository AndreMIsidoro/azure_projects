resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = "development"  # Add tags for resource identification
  }
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_name           = var.vnet_name
}

module "compute" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_vmss_id = module.network.subnet_vmss_id
  enable_debug = var.enable_debug
}

module "nginx"{
  source              = "./modules/nginx"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_nginx_id = module.network.subnet_nginx_id
  app_gateway_subnet_prefixes = module.network.app_gateway_subnet_prefixes
  jenkins_private_ip = module.compute.jenkins_private_ip
  enable_debug = true
}

module "app_gateway" {
  source              = "./modules/app_gateway"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  public_ip_appgw = module.network.public_ip_id
  subnet_appgw_id = module.network.subnet_appgw_id
  private_ip_nginx = module.nginx.private_ip_nginx
}

