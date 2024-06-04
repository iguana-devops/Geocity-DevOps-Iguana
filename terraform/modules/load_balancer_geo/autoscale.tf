resource "google_compute_autoscaler" "geo" {
  name   = "${var.env}-${var.region}-${var.app}-geocitizen-autoscaler"
  target = google_compute_instance_group_manager.geo.id

  autoscaling_policy {
    max_replicas    = 3
    min_replicas    = 1
    cooldown_period = 60

    cpu_utilization {
      target = 0.7
    }
  }
}
