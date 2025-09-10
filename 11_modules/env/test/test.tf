module "test" {
    source          = "../../aks"
    rg_name         = "TestRG"
    rg_location     = "centralus"
    acr_name        = "nextoptestacrt26"
    acr_sku         = "Basic"
    aks_name        = "nextopstestaks26"
    node_count      = 1
    env             = "Test"
}