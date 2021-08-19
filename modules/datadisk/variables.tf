variable "resource_group" {
  type    = string
  default = "group7-assignment2-rg"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "vm_linux_name" {
  default = "group7-assignment2-vm"
}
variable "disk_count" {
  default = "2"
}

variable "linuxvmid" {
  
}

variable "windows_name" {
 type = map(string)
  default = {
   name =  "group7-win-vm1"
 }
}
variable "windowsvm" {
  }
