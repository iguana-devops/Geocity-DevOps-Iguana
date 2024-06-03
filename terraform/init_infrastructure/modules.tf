module "jenkins_vm" {

  source                = "../modules/jenkins"
  instance_type         = var.instance_type
  image_type            = var.image_type
  disk_size             = 20
  vpc_network           = google_compute_network.vpc_network.self_link
  sub_network           = google_compute_subnetwork.sub_network.self_link
  app                   = var.app
  env                   = var.env
  region                = var.region
  project               = var.project
  daily_snapshot_policy = google_compute_resource_policy.daily_snapshot_policy.name
  disk_snapshot         = "${var.env}-${var.region}-${var.app}-snapshot-jenkins-init-0"
  deletion_protection   = false
}

module "jfrog_vm" {
  source                = "../modules/jfrog"
  instance_type         = var.instance_type
  image_type            = var.image_type
  disk_size             = 20
  vpc_network           = google_compute_network.vpc_network.self_link
  sub_network           = google_compute_subnetwork.sub_network.self_link
  daily_snapshot_policy = google_compute_resource_policy.daily_snapshot_policy.name
  app                   = var.app
  env                   = var.env
  region                = var.region
  deletion_protection   = false
}

module "prometheus_vm" {
  source                = "../modules/prometheus"
  instance_type         = var.instance_type
  image_type            = var.image_type
  disk_size             = 20
  vpc_network           = google_compute_network.vpc_network.self_link
  sub_network           = google_compute_subnetwork.sub_network.self_link
  daily_snapshot_policy = google_compute_resource_policy.daily_snapshot_policy.name
  app                   = var.app
  env                   = var.env
  region                = var.region
  deletion_protection   = false
}

