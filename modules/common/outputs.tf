output "group7-log_analytics_workspace" {
  description = "log analytics data"
  value       = azurerm_log_analytics_workspace.group7-linuxloganalytics
}

output "group7-recovery_services_vault" {
  description = "recovery services vault data"
  value       = azurerm_recovery_services_vault.group7-recovery_vault
}

output "group7-storage_account" {
  description = "storage account data"
  value       = azurerm_storage_account.group7-storage_account
}