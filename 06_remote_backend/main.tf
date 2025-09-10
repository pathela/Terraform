resource "azurerm_resource_group" "rg1" {
   name         = "VMRG"
   location     = "eastus"
}

resource "azurerm_virtual_network" "vnet1" {
   name                 = "NextOpsVNET28"
   resource_group_name  = azurerm_resource_group.rg1.name
   location             = azurerm_resource_group.rg1.location
   address_space        = [ "10.2.0.0/16" ] 
}

resource "azurerm_subnet" "subnet1" {
   name                 = "Subnet1"
   resource_group_name  = azurerm_resource_group.rg1.name 
   virtual_network_name = azurerm_virtual_network.vnet1.name 
   address_prefixes     = [ "10.2.0.0/24" ]
}

resource "azurerm_network_interface" "nic1" {
  name                 = "nextopslvm-nic"
  resource_group_name  = azurerm_resource_group.rg1.name
  location             = azurerm_resource_group.rg1.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm1" {
  name                  = "nextopslvm"
  resource_group_name   = azurerm_resource_group.rg1.name
  location              = azurerm_resource_group.rg1.location
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  admin_password        = "P2ssw0rd@123"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic1.id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}