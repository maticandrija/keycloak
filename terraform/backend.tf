terraform {
  backend "azurerm" {
    resource_group_name  = var.resource_group_name
    storage_account_name = var.storage_account_name
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    tenant_id            = var.tenant_id
    subscription_id      = var.subscription_id
  }
}