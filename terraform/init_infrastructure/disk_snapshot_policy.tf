resource "google_compute_resource_policy" "daily_snapshot_policy" {
  name        = "${var.env}-${var.region}-${var.app}-daily-snapshot-policy"
  description = "Snapshot policy once per day"
  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "00:00"
      }
    }
    retention_policy {
      max_retention_days    = 7
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }
    snapshot_properties {
      labels = {
        env = var.env
        app = var.app
      }
    }
  }
}