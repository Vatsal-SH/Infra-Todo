module "rg" {

   source = "../../modules/azurerm_resource_group"
   rgs= var.resource_groups 
  } 
module "aks" {
   depends_on = [ module.rg]
   source = "../../modules/azurerm_aks"
   aks_clusters = var.aks_clusters
}
module "acr" {
   depends_on = [ module.rg ]
   source = "../../modules/azurerm_acr"
   acr_configs = var.acr_configs
}