resource "google_compute_instance_group_manager" "geo" {

  name = "${var.env}-${var.region}-${var.app}-geocitizen-group-manager"
  version {
    instance_template = google_compute_instance_template.geo_template.id
    name              = "primary"
  }
  base_instance_name = "${var.env}-${var.region}-${var.app}-webapp-application"
  target_size        = 1

  named_port {
    name = "http"
    port = 8080
  }

}