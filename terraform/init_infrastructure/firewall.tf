resource "google_compute_firewall" "web_firewall" {
  name    = "${var.app}-${var.env}-${var.region}-allow-main-traffic"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}