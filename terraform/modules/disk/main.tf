############# DISK ##############

resource "google_compute_disk" "disk_jenkins" {
  name        = var.disk_name
  description = var.disk_description
  type        = var.disk_type
  size        = 20
  labels = {
    environment = var.environment
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "google_compute_resource_policy" "daily_snapshot_policy" {
  name        = var.snapshot_policy_name
  description = var.snapshot_policy_description
  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time = var.snapshot_start_time
      }
    }
    retention_policy {
      max_retention_days    = var.snapshot_max_retention_days
      on_source_disk_delete = var.snapshot_disk_deletion_policy
    }
    snapshot_properties {
      labels = {
        environment = var.environment
        snapshot    = "jenkins"
      }
    }
  }
}

resource "google_compute_disk_resource_policy_attachment" "attachment" {
  name = google_compute_resource_policy.daily_snapshot_policy.name
  disk = google_compute_disk.disk_jenkins.name
}