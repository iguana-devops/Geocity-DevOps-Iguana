resource "google_compute_global_address" "private_ip_address" {
  provider      = google
  name          = "awx-pia"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.default.id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  provider                = google-beta
  network                 = google_compute_network.default.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
  depends_on              = [google_compute_global_address.private_ip_address]
  lifecycle {
    prevent_destroy = false
    ignore_changes  = [reserved_peering_ranges]
  }
}
