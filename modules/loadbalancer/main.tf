resource "azurerm_lb" "group7-loadbalancer" {
  name                = var.load_balancer
  location            = var.location
  resource_group_name = var.resource_group
  

   frontend_ip_configuration {
    name = "PublicIPAddressVM1"
    public_ip_address_id = var.publicip_vm1
  }
   frontend_ip_configuration {
    name = "PublicIPAddressVM2"
    public_ip_address_id = var.publicip_vm2
  }
}
resource "azurerm_lb_backend_address_pool" "group7-lb-backend" {
  loadbalancer_id = azurerm_lb.group7-loadbalancer.id
  name            = "BackEndAddressPool"
}

resource "azurerm_network_interface_backend_address_pool_association" "group7-networkibapavm1" {
  network_interface_id    = var.vm1nicid
  ip_configuration_name   = "vm1configuration"
  backend_address_pool_id = azurerm_lb_backend_address_pool.group7-lb-backend.id
}

resource "azurerm_network_interface_backend_address_pool_association" "group7-networkibapavm2" {
  network_interface_id    = var.vm2nicid
  ip_configuration_name   = "vm2configuration"
  backend_address_pool_id = azurerm_lb_backend_address_pool.group7-lb-backend.id
}

resource "azurerm_lb_rule" "group7-lbrule" {
  resource_group_name            = var.resource_group
  loadbalancer_id                = azurerm_lb.group7-loadbalancer.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddressVM1"

}
resource "azurerm_lb_probe" "group7-lbprobe" {
  resource_group_name = var.resource_group
  loadbalancer_id     = azurerm_lb.group7-loadbalancer.id
  name                = "ssh-running-probe"
  port                = 22
}
