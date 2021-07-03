output "virtualmachine" {
  value = module.vmlinux.group7-linuxvirtualmachine
}

output "privateip" {

  value = module.vmlinux.group7-linuxprivateip
}

output "avaiability_set" {
  value = module.vmlinux.group7-linuxavailability_set
}

output "public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = module.vmlinux.group7-public_ip_address
}

output "virtualnetworkname" {
  description = " virtual network name"
  value       = module.network.group7-virtualnetworkname
}

output "addresspace" {
  description = "Virtual network address space"
  value       = module.network.group7-addresspace
}

output "subnet1" {
  description = "subnet 1 value"
  value       = module.network.group7-subnet1
}



output "subnetaddressprefix1" {
  description = "network address space 1"
  value       = module.network.group7-subnetaddressprefix1
}

output "subnetaddressprefix2" {
  description = "network address space 2"
  value       = module.network.group7-subnetaddressprefix1
}
