#DATASOURCES

#NETWORKING

data "azurerm_subnet" "k8s_sbunet" {
  name = "vnet-coreit-datacenternetworking-dev"
  virtual_network_name = "vnet-coreit-datacenternetworking-dev"
  resource_group_name = "rg-coreit-datacenternetworking-dev"
}
