module "network" {
  source = "./modules/network"
}

module "jenkins_vm" {
  source              = "./modules/jenkins"
  instance_name       = "jenkins"
  disk_size           = 20
  vpc_network         = module.network.vpc_network
  sub_network         = module.network.sub_network
  environment         = var.environment
  deletion_protection = false
}