output "group7-windows_hostnames" {
  value = values(azurerm_windows_virtual_machine.group7-windowsvm)[*].name
}
output "group7-windows_public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = values(azurerm_windows_virtual_machine.group7-windowsvm)[*].public_ip_address

}
output "group7-windows_private_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = values(azurerm_windows_virtual_machine.group7-windowsvm)[*].private_ip_address
}

output "group7-windows_availability_set" {
  value = azurerm_availability_set.group7-windows_av_set.name
}
