
// Improve this file as professionally as possible
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm" # Specifies the source of the azurerm provider
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.3.0" # Terraform CLI version
}


provider "azurerm" {
  features {}
}

provider "azuread" {}

