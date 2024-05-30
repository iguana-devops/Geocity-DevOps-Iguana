resource "google_storage_bucket" "bucket_tfstate" {
  name          = "dev-01-eu-west-1-geo-tf-state"
  force_destroy = false
  location      = "EU"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}