#TFVARS

main_resource_group = "myresourcegroup"
main_vnet_name      = "myvnet"

client_id           = "some_service_principal_id"
client_secret       = "some_service_principal_secret"
tenant_id           = "principal_tentant_id"
subscription_id     = "principal_subscription_id"

aks_name            = "cluster-k8s-stage2"
aks_dns_prefix      = "aks_cluster_dns"
aks_linux_admin     = "aks_worker_admin_username"
aks_linux_ssh_key   = "aks_worker_admin_ssh_public_key"

blogdb_login        = "database_username"
blogdb_password     = "database_password"
blogdb_name = "azure_mysql_database_name"
