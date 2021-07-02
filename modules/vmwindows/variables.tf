variable "windows_avs" {
  default = "windows-avs"
}
variable "windows_name" {
  type = map(string)
  default = {
    lab-web-w-vm1 = "Standard_B1s"
  }
}

variable "windows_disk_info" {
  type = map(string)
  default = {
    wos_storage_account_type = "StandardSSD_LRS"
    wos_disk_size            = "127"
    wos_disk_caching         = "ReadWrite"
  }
}

variable "windows_admin_user" {
  default = "winadm"
}

variable "admin_password" {
  default = "Winadm123"
}
variable "windows_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  default = "WindowsServer"
}
variable "windows_sku" {
  default = "2016-Datacenter"
}

variable "windows_version" {
  default = "latest"
}
locals {
  common_tags = {
    Name         = "Terraform Group Project"
    GroupMembers  = "Naga sai mounika panangiapalli,Vamsi krishna lakshmipuram"
    ExpirationDate = "2021-07-31"
    Environment  = "Lab"
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
variable "virtual_network_name" {
  default = "group7vnet"
}
variable "subnet01" {
  default = "group7subnet01"
}

variable "subnet02" {
  default = "group7subnet02"
}
variable "subnet_id" {
  description = " The default subnet id "
}
variable "subnet01_space" {
  default = ["10.0.1.0/24"]
}
variable "subnet02_space" {
  default = ["10.0.2.0/24"]
}
variable "virtual_network_address_space" {

  default = ["10.0.0.0/16"]
}


variable "network_address_space1" {
  default = "group7nsg1"
}

variable "network_address_space2" {
  default = "group7nsg2"
}
