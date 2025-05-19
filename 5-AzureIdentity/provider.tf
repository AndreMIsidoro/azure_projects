terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm" # azurerm provider version
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.3.0"#Terraform CLI version
}


provider "azurerm" {
  features {}
}

provider "azuread" {}

data "azurerm_client_config" "current" {} # retrieves metadata about the currently authenticated identity being used to run Terraform