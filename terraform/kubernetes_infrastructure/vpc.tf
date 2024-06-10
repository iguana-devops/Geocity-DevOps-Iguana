resource "google_compute_network" "vpc" {
  name                    = "${var.env}-${var.region}-${var.app}-vpc-cluster"
  delete_default_routes_on_create = false
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
}

resource "google_compute_subnetwork" "subnet" {
  name          ="${var.env}-${var.region}-${var.app}-subnet-cluster"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}