resource "google_compute_network" "vpc" {
  name                    = "${local.full_name_of_project}-vpc-cluster"
  delete_default_routes_on_create = false
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
}

resource "google_compute_subnetwork" "subnet" {
  name          ="${local.full_name_of_project}-subnet-cluster"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}