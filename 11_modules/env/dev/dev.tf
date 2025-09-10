module "dev" {
    source          = "../../aks"
    rg_name         = "DevRG"
    rg_location     = "eastus"
    acr_name        = "nextopsdevacrt26"
    acr_sku         = "Standard"
    aks_name        = "nextopsdevaks26"
    node_count      = 2
    env             = "dev"
}