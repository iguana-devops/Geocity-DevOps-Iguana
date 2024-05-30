terraform {
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
  region  = "eu-central2"
  zone    = "eu-central2-a"
}