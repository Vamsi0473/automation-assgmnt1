resource "azurerm_log_analytics_workspace" "group7-linuxloganalytics" {
  name                = var.log_analytics_workspace_linux["law_name"]
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.log_analytics_workspace_linux["log_sku"]
  retention_in_days   = var.log_analytics_workspace_linux["retention_in_days"]

  tags = local.common_tags
}

resource "azurerm_recovery_services_vault" "group7recoveryvault" {
    name = var.recovery_services_vault["vault_name"]
    location = var.location
    resource_group_name = var.resource_group
    sku = var.recovery_services_vault["vault_sku"]

    tags = local.common_tags  
}

resource "azurerm_storage_account" "group7storageaccount" {
  name                     = "group7storageaccount"
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"

  tags = local.common_tags
}
