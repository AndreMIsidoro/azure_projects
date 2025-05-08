resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
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
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  public_ip_id        = module.network.public_ip_id
}


module "storage" {
  source                    = "./modules/storage"  # Path to storage module
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  blob_local_path = var.blob_local_path
}

module "monitring" {
  source                    = "./modules/monitoring"  # Path to storage module
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  vmss_id = module.web_compute.vmss_id
  alert_email = var.alert_email
}

module "cost_management" {
  source = "./modules/cost_management"
  contact_emails = var.contact_emails
  subscription_id = var.subscription_id
}