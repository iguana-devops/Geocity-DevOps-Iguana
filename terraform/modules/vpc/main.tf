################ VPC ################

resource "google_project_service" "servicenetworking_service" {
  service            = "servicenetworking.googleapis.com"
  disable_on_destroy = false
}

resource "google_compute_network" "vpc_network" {
  name                            = var.network_name
  delete_default_routes_on_create = false
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
}

resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc_network.id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

resource "google_compute_subnetwork" "sub_network" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_address" "public_ip" {
  name    = "vm-public-address"
  project = var.project_id
  region  = var.region
}


resource "google_compute_subnetwork" "auto_scale" {
  name          = "website-net-default"
  ip_cidr_range = "10.1.2.0/24"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "proxy" {
  name          = "website-net-proxy"
  ip_cidr_range = "10.129.0.0/26"
  network       = google_compute_network.vpc_network.id
  purpose       = "REGIONAL_MANAGED_PROXY"
  role          = "ACTIVE"
}

