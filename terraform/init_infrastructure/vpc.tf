resource "google_compute_network" "vpc_network" {
  name                            = "${var.env}-${var.region}-${var.app}-vpc"
  delete_default_routes_on_create = false
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
}

resource "google_compute_subnetwork" "sub_network" {
  name          = "${var.env}-${var.region}-${var.app}-subnet-main"
  ip_cidr_range = "10.2.2.0/29"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "template_subnetwork" {
  name          = "${var.env}-${var.region}-${var.app}-subnet-templates"
  ip_cidr_range = "10.3.3.0/30"
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_subnetwork" "geocitizen-proxy" {
  name          = "${var.env}-${var.region}-${var.app}-website-net-proxy"
  ip_cidr_range = "10.129.0.0/26"
  network       = google_compute_network.vpc_network.id
  purpose       = "REGIONAL_MANAGED_PROXY"
  role          = "ACTIVE"
}

resource "google_compute_router" "router_template" {
  name    = "my-router"
  region  = google_compute_subnetwork.template_subnetwork.region
  network = google_compute_network.vpc_network.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat_template" {
  name                               = "my-router-nat"
  router                             = google_compute_router.router_template.name
  region                             = google_compute_router.router_template.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

