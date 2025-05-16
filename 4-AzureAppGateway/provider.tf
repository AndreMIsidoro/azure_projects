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