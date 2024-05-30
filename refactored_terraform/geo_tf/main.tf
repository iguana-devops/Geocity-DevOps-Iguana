terraform {
  backend "gcs" {
    bucket = "dev-01-eu-central2-geo-tf-state"
    prefix = "terraform/state/"
  }
  required_version = "1.7.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.30.0"
    }
  }
}

provider "google" {
  project = "terrafarm-423310"
  region  = var.region
  zone    = var.zone
}