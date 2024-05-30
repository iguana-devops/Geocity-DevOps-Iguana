terraform {
  backend "gcs" {
    bucket      = "dev-01-eu-west-1-geo-tf-state"
    prefix      = "terraform/state"
    credentials = "credentials.json"
  }
  required_version = "= 1.8.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.30.0"
    }
  }
}

provider "google" {
  credentials = file("credentials.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}