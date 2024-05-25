############## MAIN ##############

module "services" {
  source = "./modules/services"
}

module "vpc" {
  source     = "./modules/vpc"
  region     = var.region
  project_id = var.project_id
  depends_on = [module.services]
}

module "firewall" {
  source            = "./modules/firewall"
  vpc_network_name  = module.vpc.vpc_network_name
  depends_on        = [module.vpc]
}

module "vm" {
  source      = "./modules/vm"
  zone        = var.zone
  environment = var.environment
  vpc_network = module.vpc.vpc_network
  sub_network = module.vpc.sub_network
  public_ip   = module.vpc.public_ip
  depends_on  = [module.services ,module.firewall]
}

module "secret" {
  source     = "./modules/secret"
  depends_on = [module.services]
}

module "database" {
  source          = "./modules/database"
  environment     = var.environment
  region          = var.region
  vpc_network_id  = module.vpc.vpc_network_id
  db_user_pass    = module.secret.db_user_pass
  depends_on      = [module.vpc, module.secret]
}
