##Bogdan Catana
##AKS Module

#Resource Group is mandatory to avoid dependency problems and to allow resources to be grouped up
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.azurerm_resource_group_name}"
  location = var.azurerm_resource_group_location

  tags = {
    environment = var.azure_environment
    CostCentre  = var.azure_costcentre
    mangedBy    = "Terraform"
  }
}

#Networking bits required to be manually created for Windows nodes
resource "azurerm_route_table" "rt" {
  name                = "rt-${var.azurerm_route_table_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    environment = var.azure_environment
    CostCentre  = var.azure_costcentre
    mangedBy    = "Terraform"
  }
}

resource "azurerm_subnet_route_table_association" "assoc" {
  subnet_id      = var.azurerm_subnet_id
  route_table_id = azurerm_route_table.rt.id
}


#Cluster setup and Agent pool config
resource "azurerm_kubernetes_cluster" "kubernetes" {

  name                = var.azurerm_aks_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  dns_prefix          = var.azurerm_aks_name
  kubernetes_version  = var.azurerm_k8s_version

#  addon_profile {
#    oms_agent {
#      enabled = true
#      log_analytics_workspace_id = "${var.log_analytics_workspace_id}"
#    }
#  }

  agent_pool_profile {
    name            = "${var.azurerm_aks_name}pl"
    count           = var.azurerm_pool_count
    vm_size         = "Standard_D2_v2"
    os_type         = var.azurerm_pool_os_type
    vnet_subnet_id  = var.azurerm_subnet_id
    type            = var.azurerm_aks_pool_type
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.azurerm_client_id
    client_secret = var.azurerm_client_secret
  }

  network_profile {
    network_plugin      = "azure"
    dns_service_ip      = var.azurerm_dns_service_ip
    service_cidr        = var.azurerm_service_cidr
    docker_bridge_cidr  = var.azurerm_docker_bridge_cidr
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = var.azure_environment
    CostCentre  = var.azure_costcentre
    mangedBy    = "Terraform"
   }
}
