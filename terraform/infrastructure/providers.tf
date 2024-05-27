locals {
  cred = file("../GCP_cred.json")
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.30.0"
    }
  }
}

provider "google" {
  credentials = local.cred
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}