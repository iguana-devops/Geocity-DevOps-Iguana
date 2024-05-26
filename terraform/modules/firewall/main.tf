############## FIREWALL ##############
resource "google_compute_firewall" "web_firewall" {
  name    = "allow-web-traffic"
  network = var.vpc_network_name

  allow {
    protocol = "tcp"
    ports    = var.allowed_ports
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "fw1" {
  name          = "website-fw-1"
  network       = var.vpc_network_name
  source_ranges = ["10.1.2.0/24"]
  allow {
    protocol = "tcp"
  }
  allow {
    protocol = "udp"
  }
  allow {
    protocol = "icmp"
  }
  direction = "INGRESS"
}

resource "google_compute_firewall" "fw3" {
  name          = "website-fw-3"
  network       = var.vpc_network_name
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  allow {
    protocol = "tcp"
  }
  target_tags = ["load-balanced-backend"]
  direction   = "INGRESS"
}

resource "google_compute_firewall" "fw4" {
  depends_on    = [google_compute_firewall.fw3]
  name          = "website-fw-4"
  network       = var.vpc_network_name
  source_ranges = ["10.129.0.0/26"]
  target_tags   = ["load-balanced-backend"]
  allow {
    protocol = "tcp"
    ports    = var.allowed_auto_scale
  }
  
  direction = "INGRESS"
}