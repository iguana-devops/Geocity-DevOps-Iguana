resource "google_compute_firewall" "web_firewall" {
  name    = "${var.env}-${var.region}-${var.app}-allow-main-traffic"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["10.129.0.0/26"]
}

resource "google_compute_firewall" "allow_iguana" {
  name    = "${var.env}-${var.region}-${var.app}-allow-iguana-traffic"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["443", "22", "3000", "8443", "8081", "8082", "9090"]
  }

  source_ranges = ["5.58.107.63/32", "188.163.9.235/32", "88.155.168.196/32", "188.191.234.164/32"]
}

resource "google_compute_firewall" "allow_google" {
  name    = "${var.env}-${var.region}-${var.app}-allow-google-traffic"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]
}
