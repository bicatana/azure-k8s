#Bogdan Catana
#AKS Tooling Cluster Setup

module "aks_tooling" {
  source                              = "./module"
  azurerm_resource_group_name         = var.azurerm_resource_group_name
  azurerm_resource_group_location     = var.azurerm_resource_group_location
  azure_environment                   = var.azure_environment
  azure_costcentre                    = var.azure_costcentre
  azurerm_route_table_name            = var.azurerm_route_table_name
  azurerm_subnet_id                   = var.azurerm_subnet_id
  azurerm_dns_service_ip              = var.azurerm_dns_service_ip
  azurerm_docker_bridge_cidr          = var.azurerm_docker_bridge_cidr
  azurerm_service_cidr                = var.azurerm_service_cidr
  azurerm_aks_name                    = var.azurerm_aks_name
  azurerm_k8s_version                 = var.azurerm_k8s_version
  azurerm_pool_count                  = var.azurerm_pool_count
  azurerm_client_id                   = data.vault_generic_secret.azureprovider.data["clientid"]
  azurerm_client_secret               = data.vault_generic_secret.azureprovider.data["client_secret"]
}
