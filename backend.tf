terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateRG"
    storage_account_name = "tfstateassign1group7"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}