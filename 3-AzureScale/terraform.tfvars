resource_group_name = "azureScale-learn-rg"
location            = "East US"
vnet_name           = "AzureScale-VNet"
address_space       = [ "10.0.0.0/16" ]
subnets             = [ 
  {name="WebSubnet", address_prefix = "10.0.1.0/24"},
  {name="AppSubnet", address_prefix = "10.0.2.0/24"},
  {name="DBSubnet", address_prefix = "10.0.3.0/24"},
]
alert_email = "test@example.com"
contact_emails = [ "test@example.com" ]