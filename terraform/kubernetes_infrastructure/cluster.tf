data "google_container_engine_versions" "gke_version" {
  location = var.region
  version_prefix = "1.27."
}

resource "google_container_cluster" "primary" {
  name     = "${var.env}-${var.region}-${var.app}-gke"
  location = var.zone
  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection = false
  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.env}-${var.region}-${var.app}-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    disk_size_gb = var.gke_disk_size
    version      = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]

    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      env = var.env
      app = var.app
    }
  }
}
