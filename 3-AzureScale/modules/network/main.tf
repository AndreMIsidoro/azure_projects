#Creating virtual network
resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

#Creating subnet
resource "azurerm_subnet" "subnets" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }
  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [each.value.address_prefix]
}

# Creating public ip for load balancer
resource "azurerm_public_ip" "this" {
  name                = "${var.resource_group_name}-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Creating the network security group

resource "azurerm_network_security_group" "this" {
  for_each            = var.nsg_rules
  name                = "${each.key}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = each.value.name
    priority                   = each.value.priority
    direction                  = each.value.direction
    access                     = each.value.access
    protocol                   = each.value.protocol
    source_port_range          = "*"
    destination_port_range     = tostring(each.value.port)
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate nsgs to subnets
resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = {
    for subnet_name, subnet in azurerm_subnet.subnets : subnet_name => subnet
    if contains(keys(var.nsg_rules), subnet_name)
  }
  subnet_id                = each.value.id
  network_security_group_id = azurerm_network_security_group.this[each.key].id
}


