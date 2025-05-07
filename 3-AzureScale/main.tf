resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnets             = var.subnets
}

module "app_compute" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  subnet_id           = module.network.subnet_ids["AppSubnet"]
  admin_username      = "azureadmin"
  admin_password      = "MyP@ssw0rd123!"
  vmss_name           = "app-vmss"
  instance_count      = 2
  ssh_public_key_path = var.ssh_public_key_path
}

module "web_compute" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  subnet_id           = module.network.subnet_ids["WebSubnet"]
  admin_username      = "azureadmin"
  admin_password      = "MyP@ssw0rd123!"
  vmss_name           = "web-vmss"
  instance_count      = 2
  ssh_public_key_path = var.ssh_public_key_path
}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
  resource_group_name = var.resource_group_name
  location            = var.location
  public_ip_id        = module.network.public_ip_id
}