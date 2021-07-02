output "virtualmachine" {
  value = [azurerm_linux_virtual_machine.groups7-linuxvm1[*].name]
}

output "avaiability_set" {
  value = azurerm_availability_set.group7-linuxavset.name
}
output "privateip" {

  value = [azurerm_network_interface.group7-vm1_nic[*].private_ip_address]

}

output "public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = [azurerm_public_ip.group7-vm1_pip[*].ip_address]
}
