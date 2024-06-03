resource "google_compute_firewall" "web_firewall" {
  name    = "${var.env}-${var.region}-${var.app}-allow-main-traffic"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22", "8080", "3000", "8443", "9090", "8081", "8082"]
  }

  source_ranges = ["0.0.0.0/0"]
}