module "database" {
  source              = "../modules/database"
  vpc_id              = data.google_compute_network.vpc_network.id
  db_disk_size        = 10
  app                 = var.app
  env                 = var.env
  region              = var.region
  deletion_protection = false
}

module "load_balancer_geo" {
  source        = "../modules/load_balancer_geo"
  app           = var.app
  vpc_network   = data.google_compute_network.vpc_network.id
  sub_network   = google_compute_subnetwork.template_sub_network.id
  env           = var.env
  region        = var.region
  instance_type = var.instance_type
  image_type    = var.image_type
}
