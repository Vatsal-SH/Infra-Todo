module "rg" {

   source = "../../modules/azurerm_resource_group"
   rgs= var.resource_groups 
  } 

module "keyvault" {
   depends_on = [ module.rg ]
   source = "../../modules/azurerm_keyvault"
   key_vaults = var.key_vaults
}
module "vnet" {
   depends_on = [ module.rg ]
   source = "../../modules/azurerm_networking"
   networks = var.networks_vnet
}
module "pip" {
   depends_on = [ module.rg ]
   source = "../../modules/azurerm_public_ip"
   public_ip_configs = var.pip_configs
   
}
module "linux_vm" {
   depends_on = [ module.rg, module.vnet, module.pip ]
   source = "../../modules/azurerm_compute"
   vms = var.azurerm_linux_vm
}
module "mssql_server" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_mssql_server"
  mssql_server = var.mssqlserver
}
module "mssql_db" {
   depends_on =[module.mssql_server] 
   source = "../../modules/azurerm_mssql_database"
   mssql_database = var.mssqldatabase
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