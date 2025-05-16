#only for debug purposes
resource "azurerm_public_ip" "debug" {
  count               = var.enable_debug ? 1 : 0
  name                = "debug-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
  tags = {
    purpose = "debug"
  }
}

resource "azurerm_network_interface" "jenkins" {
  name                = "jenkis-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_vmss_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.enable_debug ? azurerm_public_ip.debug[0].id : null
  }
}

resource "azurerm_linux_virtual_machine" "jenkins" {
  name                = "jenkins-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.jenkins.id
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "jenkins-disk"
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-12"
    sku       = "12"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/azure_key.pub")
  }

  custom_data = base64encode(file("${path.module}/cloud-init/jenkins.yaml"))


  tags = {
    environment = "development"
  }
}