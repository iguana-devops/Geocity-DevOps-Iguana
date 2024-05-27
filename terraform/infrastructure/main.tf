############## MAIN ##############

resource "google_project_service" "services" {
  for_each           = toset(var.services)
  service            = each.key
  disable_on_destroy = false
}

resource "google_compute_subnetwork" "proxy" {
  name          = "website-net-proxy"
  ip_cidr_range = "10.129.0.0/26"
  network       = data.google_compute_network.vpc-dev.id
  purpose       = "REGIONAL_MANAGED_PROXY"
  role          = "ACTIVE"
}

data "google_compute_subnetwork" "sub_network" {
  name          = "subnet-dev"
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

module "auto_scale" {
  source      = "./modules/auto_scale"
  template_id = module.templates.template_id
}

module "load_balancer" {
  source          = "./modules/load_balancer"
  instance_group  = module.auto_scale.instance_group
  vpc_network_id  = data.google_compute_network.vpc-dev.id
  health_check_id = module.auto_scale.health_check_id
  certificates_id = module.certificates.certificates_id
}

module "nat" {
  source = "./modules/nat"
  vpc_id = data.google_compute_network.vpc-dev.id
}

module "templates" {
  source    = "./modules/templates"
  vpc_id    = data.google_compute_network.vpc-dev.id
  subnet_id = data.google_compute_subnetwork.sub_network.id
}

module "certificates" {
  source = "./modules/certificates"
}
