module "database_geo" {
  source              = "../modules/database_geo"
  vpc_id              = data.google_compute_network.vpc.id
  db_disk_size        = 10
  app                 = var.app
  env                 = var.env
  region              = var.region
  deletion_protection = false
}

module "load_balancer_geo" {
  source        = "../modules/load_balancer_geo"
  app           = var.app
  vpc_network   = data.google_compute_network.vpc_netowork.id
  sub_network   = data.google_compute_subnetwork.sub_network.id
  env           = var.env
  region        = var.region
  instance_type = var.instance_type
  image_type    = var.image_type
}