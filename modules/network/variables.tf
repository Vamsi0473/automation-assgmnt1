variable "virtual_network_name" {
  default = "group7vnet"
}

variable "virtual_network_address_space" {

  default = ["10.0.0.0/16"]
}

variable "subnet01" {
  default = "group7subnet01"
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
variable "resource_group" {
  type    = string
  default = "group7-assignment2-rg"
}

variable "location" {
  type    = string
  default = "canadacentral"
}
variable "subnet_id" {
}
