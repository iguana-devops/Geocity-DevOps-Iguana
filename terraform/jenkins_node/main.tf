############## MAIN ##############

resource "google_project_service" "services" {
  for_each           = toset(var.services)
  service            = each.key
  disable_on_destroy = false
}

module "network" {
  source = "./modules/network"
}

module "jenkins_vm" {
  source              = "./modules/jenkins_vm"
  instance_name       = "jenkins-vm"
  disk_size           = 20
  vpc_network         = module.network.vpc_network
  sub_network         = module.network.sub_network
  environment         = var.environment
  deletion_protection = false
}