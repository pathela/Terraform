terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.33.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}  

  client_id       = "xxxxx-xxxxxx-xxxxx-xxxxxx"
  client_secret   = "xxxxx-xxxxxx-xxxxx-xxxxxx"
  tenant_id       = "xxxxx-xxxxxx-xxxxx-xxxxxx"
  subscription_id = "xxxxx-xxxxxx-xxxxx-xxxxxx"
}

resource "azurerm_resource_group" "rg1" {
    name = "TFRG"
    location = "eastus"
} 