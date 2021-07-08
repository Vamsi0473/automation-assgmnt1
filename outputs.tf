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
output "windows_hostnames" {
  value = module.vmwindows.group7-windows_hostnames
}
output "windows_public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = module.vmwindows.group7-windows_public_ip_address

}
output "windows_private_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = module.vmwindows.group7-windows_private_ip_address
}

output "windows_availability_set" {
  value = module.vmwindows.group7-windows_availability_set
}

output "group7-log_analytics_workspace" {
  description = "log analytics data"
  value       = module.common.group7-log_analytics_workspace
}

output "group7-recovery_services_vault" {
  description = "recovery services vault data"
  value       = module.common.group7-recovery_services_vault
}

output "group7-storage_account" {
  description = "storage account data"
sensitive = true
value       = module.common.group7-storage_account
}
output "resource_group" {
  value = module.rgroup.resource_groupname
}

output "group7-loadbalancer" {
 value = module.loadbalancer.loadbalancer_name
}

output "group7-dbname" {
 value = module.database.group7-postgresdb

}
