resource "google_compute_instance" "frog_artifactory_instance" {
  name                = "${var.env}-${var.region}-${var.app}-frog-artifactory"
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
    device_name = "${var.env}-${var.region}-${var.app}-disk-jfrog-artifactory"
    source      = google_compute_disk.disk_jfrog_artifactory.id
  }

  metadata_startup_script = file("${path.module}/jfrog-registry_startup.sh")

  metadata = {
    ssh-keys = "${var.env}-${var.region}-${var.app}-jfrog-artifactory:${tls_private_key.ssh_key_jfrog_artifactory.public_key_openssh}"
  }

  labels = {
    env = var.env
    app = var.app
  }
}

resource "google_compute_address" "public_ip" {
  name = "${var.env}-${var.region}-${var.app}-jfrog-artifactory-ip"
}
