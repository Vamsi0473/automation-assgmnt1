variable "vm_linux_name" {
  default = "group7-assignment1-vm"
}
variable "resource_group" {
  type    = string
  default = "group7-assignment1-rg"
}

locals {
  common_tags = {
    Name         = "Terraform Group Project"
    GroupMembers  = "Naga sai mounika panangiapalli,Vamsi krishna lakshmipuram"
    ExpirationDate = "2021-07-31"
    Environment  = "Lab"
  }
}
variable "location" {
  type    = string
  default = "canadacentral"
}

variable "linux_avs" {
  default = "linux-avs"
}
variable "nb_count" {
  default = "2"
}
variable "subnet01" {
  default = "group7subnet01"
}
variable "vm_size" {
  default = "Standard_B1s"
}
variable "username" {
  default = "auto"
}
variable "ubuntu_os_info" {
  type = map(string)
  default = {
    los_publisher = "Canonical"
    los_offer     = "UbuntuServer"
    los_sku       = "19.04"
    los_version   = "latest"
  }
}
variable "LinuxDiagnosticVersion" {
  default =  "3.0"
}
variable "subnet_id" {
}

variable "public_key" {
  default = "/home/auto/.ssh/id_rsa.pub"
}
variable "os_disk_attributes" {
  type = map(string)
  default = {
    los_storage_account_type = "Premium_LRS"
    los_disk_size            = "32"
    los_disk_caching         = "ReadWrite"
  }
}
variable "virtual_network_address_space" {

  default = ["10.0.0.0/16"]
}



variable "subnet02" {
  default = "group7subnet02"
}

variable "subnet01_space" {
  default = ["10.0.1.0/24"]
}
variable "subnet02_space" {
  default = ["10.0.2.0/24"]
}

variable "network_address_space1" {
  default = "group7nsg1"
}

variable "network_address_space2" {
  default = "group7nsg2"
}

variable "virtual_network_name" {
  default = "group7vnet"
}
variable "storage_account_blob" {
  
}
