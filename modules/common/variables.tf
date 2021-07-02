variable "log_analytics_workspace_linux" {
  type = map(string)
  default = {
    law_name  = "linuxloganalytics"
    log_sku   = "Free"
     retention_in_days   = 30
  }
}

variable "resource_group" {
  type    = string
  default = "group7rg"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "recovery_services_vault" {

    type = map(string)
    default = {
      "vault_name" = "vm_recovery_vault"
      "vault_sku"  = "Standard"
    }
}

