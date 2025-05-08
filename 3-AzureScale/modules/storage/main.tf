resource "azurerm_storage_account" "this" {
  name                     = "azurescalestorage"  # Must be globally unique
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier              = "Standard"
  account_replication_type = "LRS"  # Locally redundant storage for availability

  tags = {
    environment = "dev"
    project     = "AzureScale"
  }
}

resource "azurerm_storage_container" "this" {
  name                  = "mycontainer"  # Container name (must be lowercase)
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"  # Options: "private", "blob", "container"
}


resource "azurerm_storage_blob" "example" {
  name                   = "hello_world.txt"  # Name of the blob
  storage_account_name   = azurerm_storage_account.this.name
  storage_container_name = azurerm_storage_container.this.name
  type                   = "Block"  # Block blobs for large files
  source                 = var.blob_local_path # Path to the local file
}