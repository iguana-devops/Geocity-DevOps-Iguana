resource "google_compute_network" "vpc_network" {
  name                            = "${var.app}-${var.env}-${var.region}-vpc"
  delete_default_routes_on_create = false
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
}

resource "google_compute_subnetwork" "sub_network" {
  name          = "${var.app}-${var.env}-${var.region}-subnet-main"
  ip_cidr_range = "10.0.0.0/16"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "geocitizen-proxy" {
  name          = "${var.app}-${var.env}-${var.region}-website-net-proxy"
  ip_cidr_range = "10.129.0.0/26"
  network       = google_compute_network.vpc_network.id
  purpose       = "REGIONAL_MANAGED_PROXY"
  role          = "ACTIVE"
}
