resource "google_compute_instance" "jfrog_instance" {
  name                = "${var.env}-${var.region}-${var.app}-jfrog"
  machine_type        = var.instance_type
  deletion_protection = var.deletion_protection

  boot_disk {
    initialize_params {
      image = var.image_type
    }
  }

  network_interface {
    network    = var.vpc_network
    subnetwork = var.sub_network
    access_config {
      nat_ip = google_compute_address.public_ip.address
    }
  }

  attached_disk {
    device_name = "${var.env}-${var.region}-${var.app}-disk-jfrog"
    source      = google_compute_disk.disk_jfrog.id
  }

  metadata_startup_script = file("${path.module}/jfrog_startup.sh")

  metadata = {
    ssh-keys = "${var.env}-${var.region}-${var.app}-jfrog:${tls_private_key.ssh_key_jfrog.public_key_openssh}"
  }

  labels = {
    env = var.env
    app = var.app
  }
}

resource "google_compute_address" "public_ip" {
  name = "${var.env}-${var.region}-${var.app}-jfrog-ip"
}
