resource "azurerm_managed_disk" "group7-disk" {
  count                = var.disk_count
  name                 = "${var.vm_linux_name}-disk${format("%1d", count.index + 1)}"
  location             = var.location
  resource_group_name  = var.resource_group
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "group7-disk-atchmnt" {
  count                = var.disk_count
  managed_disk_id    = element(azurerm_managed_disk.group7-disk[*].id, count.index+1)
  virtual_machine_id = element(var.linuxvmid,count.index+1)
  lun                = "10"
  caching            = "ReadWrite"
}

resource "azurerm_managed_disk" "group7-diskwin" { 
  for_each = var.windows_name
  name  = "${each.value}-data-disk"
  location = var.location
  resource_group_name = var.resource_group
  storage_account_type = "Standard_LRS"
  create_option = "Empty"
  disk_size_gb = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "group-windisk-atchment" {
    
    for_each  = var.windows_name
    managed_disk_id = azurerm_managed_disk.group7-diskwin[each.key].id
    virtual_machine_id = var.windowsvm[0].id
    lun = "10"
    caching = "ReadWrite"
}
