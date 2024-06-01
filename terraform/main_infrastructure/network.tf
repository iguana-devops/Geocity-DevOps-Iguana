resource "google_compute_subnetwork" "template_subnetwork" {
  name          = "${var.env}-${var.region}-${var.app}-subnet-templates"
  ip_cidr_range = "10.3.3.0/29"
  network       = data.google_compute_network.vpc_network.self_link
}

resource "google_compute_router" "router_template" {
  name    = "${var.env}-${var.region}-${var.app}-template-router"
  region  = google_compute_subnetwork.template_subnetwork.region
  network = data.google_compute_network.vpc_network.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat_template" {
  name                               = "${var.env}-${var.region}-${var.app}-template-router-nat"
  router                             = google_compute_router.router_template.name
  region                             = google_compute_router.router_template.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

resource "google_compute_route" "template_route" {
  name               = "${var.env}-${var.region}-${var.app}-route-to-template_subnetwork"
  network            = data.google_compute_network.vpc_network.self_link
  dest_range         = "10.2.2.0/29"
  next_hop_network   = google_compute_subnetwork.template_subnetwork.id
}

