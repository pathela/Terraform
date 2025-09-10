data "azurerm_resource_group" "existingrg" {
   name = "TestRG01"
}

data "azurerm_virtual_network" "existingvnet" {
   name                 = "NextOpsVNET27"
   resource_group_name  = data.azurerm_resource_group.existingrg.name
}

data "azurerm_subnet" "existingsubnet" {
   name                 = "Subnet1"
   resource_group_name  = data.azurerm_resource_group.existingrg.name 
   virtual_network_name = data.azurerm_virtual_network.existingvnet.name
}

resource "azurerm_subnet" "subnet2" {
  name                      = "Subnet2"
  resource_group_name       = data.azurerm_resource_group.existingrg.name 
  virtual_network_name      = data.azurerm_virtual_network.existingvnet.name 
  address_prefixes          = [ "10.1.1.0/24" ] 
}

resource "azurerm_subnet" "subnet3" {
  name                      = "Subnet3"
  resource_group_name       = data.azurerm_resource_group.existingrg.name 
  virtual_network_name      = data.azurerm_virtual_network.existingvnet.name 
  address_prefixes          = [ "10.1.2.0/24" ] 
}