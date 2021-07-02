output "virtualmachine" {
  value = module.linux.virtualmachine
}

output "privateip" {

  value = module.linux.privateip
}

output "avaiability_set" {
  value = module.linux.avaiability_set
}

output "public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = module.linux.public_ip_address
}
output "windows_hostnames" {
  value = module.windows.windows_hostnames
}
output "windows_public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = module.windows.windows_public_ip_address

}
output "windows_private_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = module.windows.windows_private_ip_address
}

output "windows_availability_set" {
  value = module.windows.windows_availability_set
}

output "virtualnetworkname" {
  description = " virtual network name"
  value       = module.network.virtualnetworkname
}

output "addresspace" {
  description = "Virtual network address space"
  value       = module.network.addresspace
}

output "subnet1" {
  description = "subnet 1 value"
  value       = module.network.subnet1
}

output "subnet2" {
  description = "subnet 2 value"
  value       = module.network.subnet2
}

output "subnetaddressprefix1" {
  description = "network address space 1"
  value       = module.network.subnetaddressprefix1
}

output "subnetaddressprefix2" {
  description = "network address space 2"
  value       = module.network.subnetaddressprefix1
}