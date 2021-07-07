output "group7-linuxvirtualmachine" {
  value = [azurerm_linux_virtual_machine.group7-linuxvm1[*].name]
}

output "group7-linuxavailability_set" {
  value = azurerm_availability_set.group7-linuxavset.name
}
output "group7-linuxprivateip" {

  value = [azurerm_network_interface.group7-vm1_nic[*].private_ip_address]

}

output "group7-linuxnic" { 
   value = azurerm_network_interface.group7-vm1_nic[*]
}

output "group7-public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = data.azurerm_public_ip.listofPIP.*.id
}

output "group7-linuxvirtualmachineid" {
  value = azurerm_linux_virtual_machine.group7-linuxvm1[*]
}
