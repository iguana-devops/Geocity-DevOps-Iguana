data "google_compute_network" "vpc" {
  name = "${var.app}-${var.env}-${var.region}-vpc"
}