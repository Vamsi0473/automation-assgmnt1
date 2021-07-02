terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateRG"
    storage_account_name = "tfstateassignment1_group7"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}