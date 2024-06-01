resource "google_compute_forwarding_rule" "geo" {
  name                  = "${var.env}-${var.region}-${var.app}-geocitizen-forwarding-rule"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "443"
  target                = google_compute_region_target_https_proxy.geo.id
  network               = var.vpc_network
  ip_address            = google_compute_address.load_balancer.address
  network_tier          = "STANDARD"
}

resource "google_compute_region_target_https_proxy" "geo" {
  name             = "${var.env}-${var.region}-${var.app}-geocitizen-proxy"
  url_map          = google_compute_region_url_map.geo.id
  ssl_certificates = [google_compute_region_ssl_certificate.iguana.id]
}

resource "google_compute_region_url_map" "geo" {
  name            = "${var.env}-${var.region}-${var.app}-geocitizen-map"
  default_service = google_compute_region_backend_service.geo.id
}

resource "google_compute_address" "load_balancer" {
  name         = "${var.env}-${var.region}-${var.app}-geocitizen-ip-1"
  network_tier = "STANDARD"
}


resource "google_compute_region_ssl_certificate" "iguana" {
  name        = "${var.env}-${var.region}-${var.app}-ssl-certificate-for-iguana"
  private_key = data.google_secret_manager_secret_version.private_key.secret_data
  certificate = data.google_secret_manager_secret_version.certificate.secret_data
}

data "google_secret_manager_secret_version" "private_key" {
  secret = "privkey"
}

data "google_secret_manager_secret_version" "certificate" {
  secret = "fullchain"
}