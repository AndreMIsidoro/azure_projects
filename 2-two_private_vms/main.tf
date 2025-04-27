provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "learn" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.learn.name
  location            = azurerm_resource_group.learn.location
}

# Use the VM module
module "vm" {
  source              = "./modules/vm"
  resource_group_name = azurerm_resource_group.learn.name
  location            = azurerm_resource_group.learn.location
  subnet_id           = module.network.subnet_id
  vm_count            = var.vm_count
  vm_size             = var.vm_size
  ssh_public_key_path = var.ssh_public_key_path
}

output "vm_private_ips" {
  value = module.vm.vm_private_ips
  description = "Private IP addresses of all VMs."
}
