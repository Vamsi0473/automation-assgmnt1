locals {
  common_tags = {
    Name         = "Terraform Group Project"
    GroupMembers  = "Naga sai mounika panangiapalli,Vamsi krishna lakshmipuram"
    ExpirationDate = "2021-07-31"
    Environment  = "Lab"
  }
}
variable "log_analytics_workspace_linux" {
  type = map(string)
  default = {
    law_name  = "linuxloganalytics"
    log_sku   = "Free"
     retention_in_days   = 7
  }
}

variable "resource_group" {
  type    = string
  default = "group7-assignment1-rg"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "recovery_services_vault" {

    type = map(string)
    default = {
      "vault_name" = "vmrecoveryvault"
      "vault_sku"  = "Standard"
    }
}

