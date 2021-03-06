variable "load_balancer" {
  default = "group7loadbalancer"
}
variable "resource_group" {
  type    = string
  default = "group7-assignment1-rg"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "linux_name" { 
  default = "group7-assignment1-vm"
}

variable "lb_count" {
  default = 2
}

variable "publicip_vm1" {

}
variable "publicip_vm2" {

}

variable "network_interface_id"{
 }
