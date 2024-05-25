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