module "rg-module" {
  source = "../../modules/rg-module"
  rgs    = var.rg-groups
}
module "vnets-module" {
  source     = "../../modules/vnet-module"
  vnets      = var.vnet-groups
  depends_on = [module.rg-module]


}
module "vm-module" {
  source     = "../../modules/vm-module"
  vms        = var.vm-groups
  depends_on = [module.rg-module, module.vnets-module]
}

module "bastion-module" {
  source     = "../../modules/bastion-module"
  bastions   = var.bastion-groups
  depends_on = [module.rg-module, module.vnets-module, module.vm-module]

}
module "akscluster-module" {
  source     = "../../modules/akscluster-module"
  akscluster = var.akscluster-groups
  depends_on = [module.rg-module]

}
