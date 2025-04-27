resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  location           = var.location
  resource_group_name = var.resource_group_name
  name                = "learn-nic-${count.index}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "learn-vm-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = "azureuser"
  
  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file(var.ssh_public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

output "vm_private_ips" {
  value = [for nic in azurerm_network_interface.nic : nic.private_ip_address]
  description = "Private IP addresses of the VMs."
}