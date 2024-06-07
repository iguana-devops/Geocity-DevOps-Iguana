# resource "google_service_account" "default" {
#   account_id   = "service-account-id"
#   display_name = "Service Account"
# }
resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "us-east1-b"

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  cluster    = google_container_cluster.primary.name
  location = "us-east1-b"
  #node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    #Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  autoscaling  {
    min_node_count = 1
    max_node_count = 3
  }
}