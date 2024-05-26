############## LOAD_BALANCER ##############

resource "google_compute_forwarding_rule" "default" {
  name       = "website-forwarding-rule"

  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "443"
  target                = google_compute_region_target_https_proxy.default.id
  network               = var.vpc_network_id
  ip_address            = google_compute_address.default.address
  network_tier          = "STANDARD"
}



resource "google_compute_region_target_https_proxy" "default" {
  name              = "website-proxy"
  url_map           = google_compute_region_url_map.default.id
  ssl_certificates  = [google_compute_region_ssl_certificate.default.id]


}

resource "google_compute_region_url_map" "default" {

  name            = "website-map"
  default_service = google_compute_region_backend_service.default.id
}

resource "google_compute_region_backend_service" "default" {

  load_balancing_scheme = "EXTERNAL_MANAGED"

  backend {
    group           = var.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }


  name        = "website-backend"
  protocol    = "HTTP"
  timeout_sec = 10

  health_checks = [var.health_check_id]
  port_name     = "http"
}

resource "google_compute_address" "default" {
  name         = "website-ip-1"
  network_tier = "STANDARD"
}

resource "google_compute_region_ssl_certificate" "default" {
  name        = "my-regional-certificate"
  private_key = file("./privkey.pem")
  certificate = file("./fullchain.pem")
}
