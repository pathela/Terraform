terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.33.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "NextOps"
  #   storage_account_name = "nextopssat26"                                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
  #   container_name       = "tfstate"                                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
  #   key                  = "terraform.tfstate"                   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  # }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "18696c4b-e3bd-4e73-befc-408c0c19547b"
  resource_provider_registrations = none
}

#terraform import azurerm_resource_group.myrg /subscriptions/18696c4b-e3bd-4e73-befc-408c0c19547b/resourceGroups/TestRG01
#terraform import azurerm_virtual_network.myvnet /subscriptions/18696c4b-e3bd-4e73-befc-408c0c19547b/resourceGroups/TestRG01/providers/Microsoft.Network/virtualNetworks/NextOpsVNET27
#terraform import azurerm_subnet.subnet1 /subscriptions/18696c4b-e3bd-4e73-befc-408c0c19547b/resourceGroups/TestRG01/providers/Microsoft.Network/virtualNetworks/NextOpsVNET27/subnets/Subnet1