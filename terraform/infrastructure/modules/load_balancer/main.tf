############## LOAD_BALANCER ##############

resource "google_compute_forwarding_rule" "geo" {
  name = "website-forwarding-rule"

  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "443"
  target                = google_compute_region_target_https_proxy.geo.id
  network               = var.vpc_network_id
  ip_address            = google_compute_address.load_balancer.address
  network_tier          = "STANDARD"
}



resource "google_compute_region_target_https_proxy" "geo" {
  name             = "website-proxy"
  url_map          = google_compute_region_url_map.geo.id
  ssl_certificates = [var.certificates_id]


}

resource "google_compute_region_url_map" "geo" {
  name            = "website-map"
  default_service = google_compute_region_backend_service.citizen.id

  host_rule {
    hosts        = ["*"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_region_backend_service.citizen.id

    path_rule {
      paths   = ["/citizen*"]
      service = google_compute_region_backend_service.citizen.id
    }
  }
}

resource "google_compute_region_backend_service" "citizen" {
  name                    = "citizen-backend"
  protocol                = "HTTP"
  timeout_sec             = 10
  load_balancing_scheme   = "EXTERNAL_MANAGED"

  backend {
    group           = var.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }

  health_checks = [var.health_check_id]
  port_name     = "http-8080"  
}

resource "google_compute_address" "load_balancer" {
  name         = "website-ip-1"
  network_tier = "STANDARD"
}




