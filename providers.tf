provider "azurerm" {
  version         = "1.33.1"
  client_id       = "clientid"
  tenant_id       = "tenant_id"
  client_secret   = "client_secret"
  subscription_id = "subscription_id"
}

provider "template" {
  version = "2.1"
}
