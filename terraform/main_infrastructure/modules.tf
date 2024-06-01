module "database" {
  source              = "../modules/database"
  vpc_id              = data.google_compute_network.vpc.id
  db_disk_size        = 10
  app                 = var.app
  env                 = var.env
  region              = var.region
  deletion_protection = false
}
