resource "azurerm_resource_group" "rg1" {
   name         = "NextOps"
   location     = "eastus"
}

resource "azurerm_virtual_network" "vnet1" {
   name                 = "NextOpsVNET26"
   resource_group_name  = azurerm_resource_group.rg1.name
   location             = azurerm_resource_group.rg1.location
   address_space        = [ "10.0.0.0/16" ] 
}

resource "azurerm_subnet" "subnet1" {
   name                 = "Subnet1"
   resource_group_name  = azurerm_resource_group.rg1.name 
   virtual_network_name = azurerm_virtual_network.vnet1.name 
   address_prefixes     = [ "10.0.0.0/24" ]
}

resource "azurerm_subnet" "subnet2" {
   name                 = "Subnet2"
   resource_group_name  = azurerm_resource_group.rg1.name 
   virtual_network_name = azurerm_virtual_network.vnet1.name 
   address_prefixes     = [ "10.0.1.0/24" ]
}

resource "azurerm_subnet" "subnet3" {
   name                 = "Subnet3"
   resource_group_name  = azurerm_resource_group.rg1.name 
   virtual_network_name = azurerm_virtual_network.vnet1.name 
   address_prefixes     = [ "10.0.2.0/24" ]
}

resource "azurerm_subnet" "subnet4" {
   name                 = "Subnet4"
   resource_group_name  = azurerm_resource_group.rg1.name 
   virtual_network_name = azurerm_virtual_network.vnet1.name 
   address_prefixes     = [ "10.0.3.0/24" ]
}