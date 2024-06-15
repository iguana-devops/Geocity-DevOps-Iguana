resource "google_compute_network" "vpc" {
  name                            = "${local.full_name}-vpc-cluster"
  delete_default_routes_on_create = false
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${local.full_name}-subnet-cluster"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}

data "google_compute_network" "vpc_network" {
  name = "${local.additional_app_vpc_name}-vpc"
}

resource "google_compute_network_peering" "peering-gitea-geo" {
  name         = "${local.full_name}-${var.app_additional}-peering"
  network      = google_compute_network.vpc.self_link
  peer_network = data.google_compute_network.vpc_network.self_link
}

resource "google_compute_network_peering" "peering-geo-gitea" {
  name         = "${local.additional_app_vpc_name}-${var.app}-peering"
  network      = data.google_compute_network.vpc_network.self_link
  peer_network = google_compute_network.vpc.self_link
}