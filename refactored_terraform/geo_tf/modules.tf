module "monitoring-prometheus" {
  source       = "../modules/monitoring-prometheus"
  network      = google_compute_network.geo-network.id
  subnetwork   = google_compute_subnetwork.geo-subnetwork.id
  env          = var.env
  region       = var.region
  machine_type = var.machine_type
}