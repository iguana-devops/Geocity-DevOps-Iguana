resource "google_storage_bucket" "bucket_tfstate" {
  name          = "${var.app}-${var.env}-${var.region}-tf-state"
  force_destroy = false
  location      = "EU"
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 30
    }
  }

  lifecycle {
    prevent_destroy = true
  }

  labels = {
    env = var.env
    app = var.app
  }
}