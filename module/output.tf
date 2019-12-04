output "kube_id" {
  description = "Kubernetes Cluster ID"
  value       = "${azurerm_kubernetes_cluster.kubernetes.id}"
}

output "kube_fqdn" {
  description = "Kubernetes Cluster FQDN"
  value       = "${azurerm_kubernetes_cluster.kubernetes.fqdn}"
}

output "kube_config" {
  description = "Raw Kubernetes Config"
  value       = "${azurerm_kubernetes_cluster.kubernetes.kube_config_raw}"
}
