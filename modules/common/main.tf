resource "azurerm_log_analytics_workspace" "group7-linuxloganalytics" {
  name                = var.log_analytics_workspace_linux.name
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.log_analytics_workspace_linux.log_sku
  retention_in_days   = var.log_analytics_workspace_linux.retention_in_days

  tags = local.common_tags
}

resource "azurerm_recovery_services_vault" "group7-recovery_vault" {
    name = var.recovery_services_vault["vault_name"]
    location = var.location
    resource_group_name = var.resource_group
    sku = var.recovery_services_vault["vault_sku"]

    tags = local.common_tags  
}