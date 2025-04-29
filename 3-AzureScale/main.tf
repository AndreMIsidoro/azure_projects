resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
}


module "loadbalancer" {
  source              = "./modules/loadbalancer"
  resource_group_name = var.resource_group_name
  location            = var.location
  public_ip_id        = module.network.public_ip_id
}