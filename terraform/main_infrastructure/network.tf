resource "google_compute_router" "router_template" {
  name    = "${var.env}-${var.region}-${var.app}-template-router"
  region  = data.google_compute_subnetwork.sub_network.region
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

resource "google_compute_subnetwork" "template_sub_network" {
  name          = "${var.env}-${var.region}-${var.app}-subnet-template"
  ip_cidr_range = "10.3.3.0/29"
  network       = data.google_compute_network.vpc_network.self_link
}

resource "google_compute_firewall" "allow_iguana" {
  name    = "${var.env}-${var.region}-${var.app}-allow-iguana-traffic"
  network = data.google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["443", "22", "3000", "8443", "8081", "8082", "9090"]
  }

  source_ranges = ["5.58.107.63/32", "188.163.9.235/32"]
}

resource "google_compute_firewall" "allow_prometheus" {
  name    = "${var.env}-${var.region}-${var.app}-allow-prometheus-traffic"
  network = data.google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["9100", "8081", "8082"]
  }

  source_ranges = ["10.0.0.0/8"]
}

resource "google_compute_firewall" "allow_google" {
  name    = "${var.env}-${var.region}-${var.app}-allow-prometheus-traffic"
  network = data.google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]
}







