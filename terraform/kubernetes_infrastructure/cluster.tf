resource "google_container_cluster" "primary" {
  name     = "${local.full_name_of_project}-gke"
  location = var.zone
  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection = false
  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${local.full_name_of_project}-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    disk_size_gb = var.gke_disk_size

    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      env = var.env
      app = var.app
    }
  }
}
