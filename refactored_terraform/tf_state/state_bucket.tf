resource "google_storage_bucket" "static-site" {
  name          = "dev-01-eu-central2-geo-tf-state"
  location      = "EU"
  force_destroy = true
}