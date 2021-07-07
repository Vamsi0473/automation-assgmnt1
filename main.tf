module "network" {
  source    = "./modules/network"
 depends_on = [
    module.rgroup
  ]  
subnet_id = module.network.group7-subnet1
}
module "rgroup"{
    source = "./modules/rgroup"
}
module "vmlinux" {

  source = "./modules/vmlinux"
  depends_on = [
    module.rgroup
  ]
  subnet_id = module.network.group7-subnet1
  storage_account_blob = module.common.group7-storage_account
    
}

module "vmwindows" {

  source = "./modules/vmwindows"
  depends_on = [
  module.rgroup,module.loadbalancer
  ]
  storage_account_blob = module.common.group7-storage_account
  subnet_id = module.network.group7-subnet1
 }

 module "loadbalancer" {
      source = "./modules/loadbalancer"
      depends_on = [module.vmlinux,module.rgroup]
      network_interface_id  = module.vmlinux.group7-linuxnic
      publicip_vm1 = module.vmlinux.group7-public_ip_address[0]
      publicip_vm2 = module.vmlinux.group7-public_ip_address[1] 
}
 module "database" {
      source = "./modules/database"
      depends_on  = [ module.rgroup,module.loadbalancer]
 }
module "common" {
  source = "./modules/common"
  depends_on = [ module.rgroup ]
} 

module "datadisk" {
  source = "./modules/datadisk"
  depends_on = [ module.vmlinux,module.vmwindows]
  linuxvmid = module.vmlinux.group7-linuxvirtualmachineid[*].id
  windowsvm = module.vmwindows.group7-windowsvmid
}
