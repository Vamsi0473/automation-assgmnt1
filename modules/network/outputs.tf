output "virtualnetworkname" {
  description = " virtual network name"
  value       = azurerm_virtual_network.group7-vnet.name
}

output "addresspace" {
  description = "Virtual network address space"
  value       = azurerm_virtual_network.group7-vnet.address_space
}

output "subnet1" {
  description = "subnet 1 value"
  value       = azurerm_subnet.group7-subnet1
}

output "subnet2" {
  description = "subnet 2 value"
  value       = azurerm_subnet.group7-subnet2
}

output "subnetaddressprefix1" {
  description = "network address space 1"
  value       = azurerm_subnet.group7-subnet1.address_prefixes
}

output "subnetaddressprefix2" {
  description = "network address space 2"
  value       = azurerm_subnet.group7-subnet2.address_prefixes

}
