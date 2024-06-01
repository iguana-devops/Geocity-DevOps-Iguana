resource "google_compute_region_backend_service" "geo" {

  load_balancing_scheme = "EXTERNAL_MANAGED"

  backend {
    group           = google_compute_instance_group_manager.geo.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }


  name        = "${var.env}-${var.region}-${var.app}-geocitizen-backend-service"
  protocol    = "HTTP"
  timeout_sec = 10

  health_checks = [google_compute_region_health_check.geo.id]
  port_name     = "http"
}