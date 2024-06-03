resource "google_compute_firewall" "web_firewall" {
  name    = "${var.env}-${var.region}-${var.app}-allow-main-traffic"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}