#INSIGHTS

#resource "random_id" "workspace" {
#  keepers = {
    # Generate a new id each time we switch to a new resource group
#    group_name = "${azurerm_resource_group.main_resource_group.name}"
#  }
#
#  byte_length = 8
#}

resource "azurerm_log_analytics_workspace" "workspace" {
#  name                = "k8s-workspace-${random_id.workspace.hex}"
  name                = "k8s-workspace-insights"
  location            = "${azurerm_resource_group.main_resource_group_location.location}"
  resource_group_name = "${azurerm_resource_group.main_resource_group.name}"
  sku                 = "PerGB2018"
}

resource "azurerm_log_analytics_solution" "insights" {
  solution_name         = "K8sContainerInsights"
  location              = "${azurerm_resource_group.main_resource_group_location.location}"
  resource_group_name   = "${azurerm_resource_group.main_resource_group.name}"
  workspace_resource_id = "${azurerm_log_analytics_workspace.workspace.id}"
  workspace_name        = "${azurerm_log_analytics_workspace.workspace.name}"

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
