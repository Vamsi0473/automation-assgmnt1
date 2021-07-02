resource "azurerm_availability_set" "group7-windows_av_set" {
  name                = var.windows_avs
  location            = var.location
  resource_group_name = var.resource_group
  managed             = true
  depends_on          = [var.resource_group]
  tags                = local.common_tags
}
resource "azurerm_windows_virtual_machine" "group7-windowsvm" {
  name                  = each.key
  for_each              = var.windows_name
  location              = var.location
  resource_group_name   = var.resource_group
  size                  = each.value
  admin_username        = var.windows_admin_user
  admin_password        = var.admin_password
  availability_set_id   = azurerm_availability_set.group7-windows_av_set.id
  network_interface_ids = [azurerm_network_interface.group7-windows_nic[each.key].id]
  computer_name         = each.key
  tags                  = local.common_tags
  os_disk {
    name                 = "${each.key}-os.disk"
    caching              = var.windows_disk_info["wos_disk_caching"]
    storage_account_type = var.windows_disk_info["wos_storage_account_type"]
    disk_size_gb         = var.windows_disk_info["wos_disk_size"]
  }

  source_image_reference {
    publisher = var.windows_publisher
    offer     = var.windows_offer
    sku       = var.windows_sku
    version   = var.windows_version
  }

}

resource "azurerm_network_interface" "group7-windows_nic" {
  for_each            = var.windows_name
  tags                = local.common_tags
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group
  ip_configuration {
    name                          = each.key
    subnet_id                     = var.subnet_id.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.group7-windowsvm_pip[each.key].id
  }
  depends_on = [
    var.resource_group,
    var.virtual_network_name
  ]

}
resource "azurerm_public_ip" "group7-windowsvm_pip" {
  for_each            = var.windows_name
  tags                = local.common_tags
  name                = "${each.key}-pip"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Dynamic"
  depends_on          = [var.resource_group]
}
