output "group7-linuxvirtualmachine" {
  value = [azurerm_linux_virtual_machine.groups7-linuxvm1[*].name]
}

output "group7-linuxavaiability_set" {
  value = azurerm_availability_set.group7-linuxavset.name
}
output "group7-linuxprivateip" {

  value = [azurerm_network_interface.group7-vm1_nic[*].private_ip_address]

}

output "group7-public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = [azurerm_public_ip.group7-vm1_pip[*].ip_address]
}