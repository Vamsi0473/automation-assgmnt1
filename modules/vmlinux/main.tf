resource "azurerm_availability_set" "group7-linuxavset" {
  name                = var.linux_avs
  location            = var.location
  resource_group_name = var.resource_group
}
resource "azurerm_linux_virtual_machine" "group7-linuxvm1" {
  count                 = var.nb_count
  tags                  = local.common_tags
  name                  = "${var.vm_linux_name}${format("%1d", count.index + 1)}"
  resource_group_name   = var.resource_group
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.username
  computer_name         = "${var.vm_linux_name}${format("%1d", count.index + 1)}"
  network_interface_ids = [element(azurerm_network_interface.group7-vm1_nic[*].id, count.index)]
 availability_set_id   = azurerm_availability_set.group7-linuxavset.id
 depends_on            = [azurerm_availability_set.group7-linuxavset]
  admin_ssh_key {
    username   = var.username
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${var.vm_linux_name}-os-disk${format("%1d", count.index + 1)}"
    caching              = var.os_disk_attributes["los_disk_caching"]
    storage_account_type = var.os_disk_attributes["los_storage_account_type"]
  }

  source_image_reference {
    publisher = var.ubuntu_os_info["los_publisher"]
    offer     = var.ubuntu_os_info["los_offer"]
    sku       = var.ubuntu_os_info["los_sku"]
    version   = var.ubuntu_os_info["los_version"]
  }

   boot_diagnostics {
     storage_account_uri = var.storage_account_blob.primary_blob_endpoint
   }

}
resource "azurerm_network_interface" "group7-vm1_nic" {
  count               = var.nb_count
  tags                = local.common_tags
  name                = "${var.vm_linux_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.resource_group
  ip_configuration {
    name                          = "${var.vm_linux_name}-nic-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.group7-vm1_pip[*].id, count.index)
  }
}
resource "azurerm_public_ip" "group7-vm1_pip" {
  count               = var.nb_count
  tags                = local.common_tags
  domain_name_label = "${var.vm_linux_name}${format("%1d", count.index + 1)}"
  name                = "${var.vm_linux_name}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Dynamic"

}

data "azurerm_public_ip" "listofPIP" {
  count               = var.nb_count
  name                = azurerm_public_ip.group7-vm1_pip[count.index].name
  resource_group_name = azurerm_linux_virtual_machine.group7-linuxvm1[count.index].resource_group_name
}

data "azurerm_network_interface" "listofNIC" {
  count               = var.nb_count
  name                = azurerm_network_interface.group7-vm1_nic[count.index].name
  resource_group_name = azurerm_linux_virtual_machine.group7-linuxvm1[count.index].resource_group_name
}


 
