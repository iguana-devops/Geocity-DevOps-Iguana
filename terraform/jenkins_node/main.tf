############## MAIN ##############

resource "google_project_service" "services" {
  for_each           = toset(var.services)
  service            = each.key
  disable_on_destroy = false
}

module "network" {
  source     = "./modules/network"
  region     = var.region
  project_id = var.project_id
}

module "vm" {
  source                       = "./modules/vm"
  instance_name                = "jenkins-vm"
  disk_size                    = 20
  vpc_network                  = module.network.vpc_network
  sub_network                  = module.network.sub_network
  public_ip                    = module.network.public_ip
  environment                  = var.environment
  instance_deletion_protection = false
}
