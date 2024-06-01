data "google_compute_network" "vpc_network" {
  name = "${var.env}-${var.region}-${var.app}-vpc"
}

data "google_compute_subnetwork" "sub_network" {
  name = "${var.env}-${var.region}-${var.app}-subnet-main"
}

data "google_compute_subnetwork" "template_subnetwork" {
  name = "${var.env}-${var.region}-${var.app}-subnet-templates"
}