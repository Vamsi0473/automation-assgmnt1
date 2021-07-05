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
  managed_disk_id    = element(azurerm_managed_disk.group7-disk[*].id, count.index)
  virtual_machine_id = element(var.linuxvmid,count.index)
  lun                = "10"
  caching            = "ReadWrite"
}