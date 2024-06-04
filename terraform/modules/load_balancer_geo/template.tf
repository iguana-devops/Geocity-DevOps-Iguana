resource "google_compute_instance_template" "geo_template" {
  name         = "${var.env}-${var.region}-${var.app}-template-geocitizen-webapp"
  machine_type = "e2-micro"

  network_interface {
    network    = var.vpc_network
    subnetwork = var.sub_network
  }

  disk {
    source_image = var.image_type
    auto_delete  = true
    boot         = true
  }



  tags = ["allow-ssh", "load-balanced-backend"]

  metadata = {
    ssh-keys = "ubuntu:${data.google_secret_manager_secret_version.ssh_key.secret_data}"
  }
}

data "google_secret_manager_secret_version" "ssh_key" {
  secret = "rsa_pub"
}
