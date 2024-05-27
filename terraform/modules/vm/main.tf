############## VM ##############

resource "google_compute_instance" "vm_instance" {
  name                = var.instance_name
  machine_type        = var.instance_type
  deletion_protection = var.instance_deletion_protection

  boot_disk {
    initialize_params {
      image = "${var.image_project}/${var.image_family}"
    }
  }

  network_interface {
    network    = var.vpc_network
    subnetwork = var.sub_network

    access_config {
      nat_ip = var.public_ip
    }
  }
  
  attached_disk {
    source      = var.disk_jenkins_id
    device_name = var.disk_name
  }
  
  metadata_startup_script = file("${path.module}/startup.sh")
  metadata = {
    ssh-keys = "${var.instance_name}:${var.ssh_key_pub}"
  }

  labels = {
    environment = var.environment
  }
}
