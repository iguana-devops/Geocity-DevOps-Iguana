resource "google_compute_network" "geo-network" {
  name = "${var.env}-${var.region}-geo-network"
}

resource "google_compute_subnetwork" "geo-subnetwork" {
  name          = "${var.env}-${var.region}-geo-subnetwork"
  network       = google_compute_network.geo-network.name
  region        = var.region
  ip_cidr_range = "10.2.0.0/16"
}

