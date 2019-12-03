# CLUSTER

resource "azurerm_resource_group" "rg-k8s-stage2" {
  name     = "rg-k8s-stage2"
  location = "${var.main_resource_group_location}"
}

resource "azurerm_kubernetes_cluster" "cl-kubernetes-test" {
  name                = "${var.aks_name}"
  location            = "${azurerm_resource_group.rg-k8s-stage2.location}"
  resource_group_name = "${azurerm_resource_group.rg-k8s-stage2.name}"
  dns_prefix          = "k8s"

  addon_profile {
    oms_agent {
      enabled = true
      log_analytics_workspace_id = "${var.log_analytics_workspace_id}"
    }
  }

  linux_profile {
    admin_username = "${var.aks_linux_admin}"

    ssh_key {
      key_data = "${var.aks_linux_ssh_key}"
    }
  }

  agent_pool_profile {
    name            = "k8sec2"
    count           = 2
    vm_size         = "Standard_D1_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
    vnet_subnet_id = "${data.azurerm_subnet.k8s_sbunet.id}"
  }

  service_principal {
   client_id     = "${var.client_id}"
   client_secret = "${var.client_secret}"
   }

  tags {
        Environment = "Prod"
        BudgetCode  = "10230"
        Department = "CoreIT"
        Description = "Prod Kubernetes Cluster"
        CreatedBy = "admin-catanab"
        Service = "Kubernetes"
  }
}

output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.cl-kubernetes-test.kube_config.0.client_certificate}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.cl-kubernetes-test.kube_config_raw}"
}
