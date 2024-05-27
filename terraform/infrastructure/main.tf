############## MAIN ##############

resource "google_project_service" "services" {
  for_each           = toset(var.services)
  service            = each.key
  disable_on_destroy = false
}

data "google_compute_network" "vpc-dev" {
  name = "vpc-dev"
}

module "database" {
  source                 = "./modules/database"
  region                 = var.region
  vpc_network_id         = data.google_compute_network.vpc-dev.id
  environment            = var.environment
  db_deletion_protection = false
}
