############## VM ##############

resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = var.zone

  tags = var.network_tags

  boot_disk {
    initialize_params {
      image = "${var.image_project}/${var.image_family}"
      labels = {
        my_label = var.environment
      }
    }
  }

  network_interface {
    network    = var.vpc_network
    subnetwork = var.sub_network

    access_config {
      nat_ip = var.public_ip
    }
  }

  metadata_startup_script = file("${path.module}/startup.sh")

}
