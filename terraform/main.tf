############## MAIN ##############

module "services" {
  source = "./modules/services"
}

module "vpc" {
  source      = "./modules/vpc"
  region      = var.region
  project_id  = var.project_id
}

module "firewall" {
  source            = "./modules/firewall"
  vpc_network_name  = module.vpc.vpc_network_name
}

module "disk" {
  source      = "./modules/disk"
  environment = var.environment
}

module "vm" {
  source          = "./modules/vm"
  vpc_network     = module.vpc.vpc_network
  sub_network     = module.vpc.sub_network
  public_ip       = module.vpc.public_ip
  disk_jenkins_id = module.disk.disk_jenkins_id
  ssh_key_pub     = module.secret.ssh_key_jenkins_pub
  environment     = var.environment
  depends_on      = [ module.disk ]
}

module "secret" {
  source     = "./modules/secret"
  environment = var.environment
}

module "database" {
  source          = "./modules/database"
  region          = var.region
  vpc_network_id  = module.vpc.vpc_network_id
  db_user_pass    = module.secret.db_user_pass
  environment     = var.environment
  depends_on      = [ module.vpc ]
}
