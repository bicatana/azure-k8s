#PROVIDERS


provider "azurerm" {
  version = ">=1.28.0"
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  subscription_id = "${var.subscription_id}"
  tenant_id = "${var.tenant_id}"
 }

provider "kubernetes" {
  host = "${azurerm_kubernetes_cluster.aks.kube_config.0.host}"

  client_certificate     = "${base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)}"
  client_key             = "${base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_key)}"
  cluster_ca_certificate = "${base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)}"
}
