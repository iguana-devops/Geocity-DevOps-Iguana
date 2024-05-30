############## templates ##############

resource "google_compute_instance_template" "instance_template" {
  name         = "template-website-backend"
  machine_type = "e2-medium"

  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnet_id


  }

  disk {
    source_image = data.google_compute_image.ubuntu.self_link
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
data "google_compute_image" "ubuntu" {
  family  = "ubuntu-2204-lts"
  project = "ubuntu-os-cloud"
}