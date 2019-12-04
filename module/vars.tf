#Variables File

#Resource Group Vars

variable "azurerm_resource_group_name" {}

variable "azurerm_resource_group_location" {}

variable "azure_environment" {}

variable "azure_costcentre" {}

#Networking Vars

variable "azurerm_route_table_name" {}

variable "azurerm_subnet_id" {}

variable "azurerm_dns_service_ip" {}

variable "azurerm_service_cidr" {}

variable "azurerm_docker_bridge_cidr" {}

#AKS Cluster Vars

variable "azurerm_aks_name" {}

variable "azurerm_k8s_version" {}

variable "azurerm_pool_count" {}

variable "azurerm_pool_os_type" {
    default = "Linux"
}

variable "azurerm_aks_pool_type" {
    default = "AvailabilitySet"
}

variable "azurerm_client_id" {}

variable "azurerm_client_secret" {}
