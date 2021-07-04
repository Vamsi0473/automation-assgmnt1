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
  module.rgroup
  ]
subnet_id = module.network.group7-subnet1
 }
# module "datadisk" {
#      source = "./modules/datadisk"
# }

 module "loadbalancer" {
      source = "./modules/loadbalancer"
      depends_on = [module.vmlinux]
      vm1nicid = module.vmlinux.group7-linuxnic[0]
      vm2nicid = module.vmlinux.group7-linuxnic[1]
      publicip_vm1 = module.vmlinux.group7-public_ip_address[1]
      publicip_vm2 = module.vmlinux.group7-public_ip_address[0]

}
# module "database" {
#      source = "./modules/database"
# }
module "common" {
  source = "./modules/common"
  depends_on = [ module.rgroup ]
} 
