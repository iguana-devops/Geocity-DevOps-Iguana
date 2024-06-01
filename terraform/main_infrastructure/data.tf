data "google_compute_network" "vpc_network" {
  name = "${var.app}-${var.env}-${var.region}-vpc"
}

data "google_compute_subnetwork" "sub_network" {
  name = "${var.app}-${var.env}-${var.region}-subnet-main"
}