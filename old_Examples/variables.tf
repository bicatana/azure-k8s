#VARIABLES

variable "client_id" {
}

variable "client_secret" {
}

variable "tenant_id" {
}

variable "subscription_id" {
}

variable "main_resource_group" {
}

variable "main_resource_group_location" {
	default     = "UK South"
}

variable "main_vnet_name" {
}

variable "main_vnet_space" {
	default = "172.28.32.0/19"
}

variable "aks_subnet_address" {
	default = "172.28.34.0/24"
}

variable "aks_name" { }

variable "aks_dns_prefix" { }

variable "aks_linux_admin" {
  default = "ansible"
}

variable "aks_linux_ssh_key" {
  default = ""
}

variable "aks_agent_size" {
  default = "Standard_DS1_v2"
}

variable "aks_agent_pool" {
  default = "agentpool"
}

variable "aks_agent_count" {
  default = "1"
}

variable "aks_agent_count_max" {
  default = "4"
}

variable "autoscaler_version" {
  default = "v1.13.0"
}

variable "aks_version" {
  default = "1.11.5"
}


variable "log_analytics_workspace_id" {
  default = ""
}
