module "jenkins_vm" {
  source              = "../modules/jenkins"
  instance_type       = var.instance_type
  image_type          = var.image_type
  disk_size           = 20
  vpc_network         = google_compute_network.vpc_network.self_link
  sub_network         = google_compute_subnetwork.sub_network.self_link
  app                 = var.app
  env                 = var.env
  region              = var.region
  deletion_protection = false
}