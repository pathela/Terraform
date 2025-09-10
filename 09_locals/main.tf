locals {
  rg_name       = azurerm_resource_group.rg1.name
  rg_location   = azurerm_resource_group.rg1.location
  vnet_name     = azurerm_virtual_network.vnet1.name
  prefix        = "nextops"
}

resource "azurerm_resource_group" "rg1" {
   name         = join("-",[local.prefix,var.rg_name])  #nextops-localsrg
   location     = var.rg_location
}

resource "azurerm_virtual_network" "vnet1" {
   name                 = join("-",[local.prefix,var.vnet_name])    #nextops-localsvnet
   resource_group_name  = local.rg_name
   location             = local.rg_location
   address_space        = var.vnet_addressspace
}

resource "azurerm_subnet" "subnet1" {
   name                 = var.subnet_name
   resource_group_name  = local.rg_name
   virtual_network_name = local.vnet_name
   address_prefixes     = var.subnet1_addressprefix
}

