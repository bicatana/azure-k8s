#Resource Group & Tags

variable "azurerm_resource_group_name" {
  default = ""
}

variable "azurerm_resource_group_location" {
  default = "North Europe"
}

variable "azure_environment" {
  default = ""
}

variable "azure_costcentre" {
  default = ""
}

#Networking

variable "azurerm_route_table_name" {
  default = ""
}

variable "azurerm_subnet_id" {
  default = ""
}

variable "azurerm_dns_service_ip" {
  default = "192.168.188.10"
}

variable "azurerm_service_cidr" {
  default = "192.168.188.0/23"
}

variable "azurerm_docker_bridge_cidr" {
  default = "172.172.0.10/23"
}

#AKS
variable "azurerm_aks_name" {
  default = ""
}

variable "azurerm_k8s_version" {
  default = "1.13.12"
}

variable "azurerm_pool_count" {
  default = 3
}