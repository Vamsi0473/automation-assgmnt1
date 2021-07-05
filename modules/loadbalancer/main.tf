resource "azurerm_lb" "group7-loadbalancer" {
  name                = var.load_balancer
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "Basic"

   frontend_ip_configuration {
    name = "PublicIPAddressVM1"
    public_ip_address_id = azurerm_public_ip.group7-lbpublicip1.id
}
   
}
resource "azurerm_public_ip" "group7-lbpublicip1" {
  name                = "lbpublicip1"
  resource_group_name =  var.resource_group
  location            = var.location
  allocation_method   = "Dynamic"

 }

resource "azurerm_lb_backend_address_pool" "group7-lb-backend" {
  loadbalancer_id = azurerm_lb.group7-loadbalancer.id
  name            = "BackEndAddressPool"
}

resource "azurerm_network_interface_backend_address_pool_association" "group7-networkibapavm1" {
  count  = var.lb_count
  network_interface_id  = element(var.network_interface_id, count.index + 1).id
  ip_configuration_name   =  element(var.network_interface_id,count.index + 1).name
  backend_address_pool_id = azurerm_lb_backend_address_pool.group7-lb-backend.id
}

#resource "azurerm_network_interface_backend_address_pool_association" "group7-networkIibapavm2" {
  #network_interface_id    = "group7-assignment1-vm-nic-2"
  #ip_configuration_name   = "group7-assignment1-vm-nic-2"
 # backend_address_pool_id = azurerm_lb_backend_address_pool.group7-lb-backend.id
#}

resource "azurerm_lb_rule" "group7-lbrule" {
  resource_group_name            = var.resource_group
  loadbalancer_id                = azurerm_lb.group7-loadbalancer.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddressVM1"

}
resource "azurerm_lb_probe" "group7-lbprobe" {
  resource_group_name = var.resource_group
  loadbalancer_id     = azurerm_lb.group7-loadbalancer.id
  name                = "ssh-running-probe"
  port                = 22
}

