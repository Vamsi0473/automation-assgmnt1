resource "azurerm_virtual_network" "group7-vnet" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = var.virtual_network_address_space
}
resource "azurerm_subnet" "group7-subnet1" {
  name                 = var.subnet01
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.group7-vnet.name
  address_prefixes     = var.subnet01_space
}



resource "azurerm_network_security_group" "group7-nsg1" {
  name                = var.network_address_space1
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "Winrm"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985-5986"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_network_security_group" "group7-nsg2" {
  name                = var.network_address_space2
  location            = var.location
  resource_group_name = var.resource_group
  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "HTTP"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "lab01-nsg1-group7-subnet1" {
  subnet_id                 = azurerm_subnet.group7-subnet1.id
  network_security_group_id = azurerm_network_security_group.group7-nsg1.id
}



