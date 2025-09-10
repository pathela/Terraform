resource "azurerm_resource_group" "myrg" {
    name     = "TestRG01"
    location = "eastus"  
}

resource "azurerm_virtual_network" "myvnet" {
    name                = "NextOpsVNET27"
    resource_group_name = azurerm_resource_group.myrg.name
    location            = azurerm_resource_group.myrg.location 
    address_space       = [ "10.1.0.0/16" ] 
    
    tags = { 
        env = "prod",
        createdby = "charan" 
    }   
}

resource "azurerm_subnet" "subnet1" {
    name                    = "Subnet1"
    resource_group_name     = azurerm_resource_group.myrg.name 
    virtual_network_name    = azurerm_virtual_network.myvnet.name 
    address_prefixes        = [ "10.1.0.0/24" ]
}