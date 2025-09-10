resource "azurerm_resource_group" "rg1" {
    name     = "WebRG"
    location = "westus"
}

resource "azurerm_service_plan" "asp1" {
  name                = "nextopsaspt26"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "app1" {
  name                = "nextopswat26"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  service_plan_id     = azurerm_service_plan.asp1.id

  site_config {}
}