resource "google_compute_network" "vpc_network" {
  name                            = "${var.env}-${var.region}-${var.app}-vpc"
  delete_default_routes_on_create = false
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
}

resource "google_compute_subnetwork" "sub_network" {
  name          = "${var.env}-${var.region}-${var.app}-subnet-main"
  ip_cidr_range = "10.2.2.0/28"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "geocitizen-proxy" {
  name          = "${var.env}-${var.region}-${var.app}-website-net-proxy"
  ip_cidr_range = "10.129.0.0/26"
  network       = google_compute_network.vpc_network.id
  purpose       = "REGIONAL_MANAGED_PROXY"
  role          = "ACTIVE"
}

