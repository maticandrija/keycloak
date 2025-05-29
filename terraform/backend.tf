terraform {
  backend "azurerm" {
    resource_group_name  = "RG"
    storage_account_name = "tfstate744amkeycloak"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    tenant_id            = "568c7c02-abcf-4a01-bf1a-712dfa387476"
    subscription_id      = "712e60af-6f36-4fb3-b21d-bd697b17fa16"
  }
}