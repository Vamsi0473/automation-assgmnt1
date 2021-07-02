module "network" {
  source    = "./modules/network"
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

# module "vmwindows" {

#   source = "./modules/vmwindows"
#   depends_on = [
#     module.resource_group
#   ]
#   subnet_id = module.network.group7-subnet1
# }
# module "datadisk" {
#      source = "./modules/datadisk"
# }

# module "loadbalancer" {
#      source = "./modules/loadbalancer"
# }
# module "database" {
#      source = "./modules/database"
# }
module "common" {
  source = "./modules/common"

} 