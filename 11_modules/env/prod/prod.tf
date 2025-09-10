module "prod" {
    source          = "../../aks"
    rg_name         = "ProdRG"
    rg_location     = "westus"
    acr_name        = "nextopsprodacrt26"
    acr_sku         = "Premium"
    aks_name        = "nextopsprodaks26"
    node_count      = 3
    env             = "prod"
}