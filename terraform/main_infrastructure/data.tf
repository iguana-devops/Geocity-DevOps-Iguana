data "google_compute_network" "vpc" {
  name = "${var.env}-${var.region}-${var.app}-vpc"
}