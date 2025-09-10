resource "azurerm_resource_group" "rg1" {
    name = "NextOpsRG"
    location = "eastus"

    lifecycle {
      prevent_destroy = true  
    }
}

resource "azurerm_virtual_network" "vnet" {
    name = "NextOpsVNET"
    resource_group_name = azurerm_resource_group.rg1.name 
    location = azurerm_resource_group.rg1.location
    address_space = ["10.30.0.0/16"]
}