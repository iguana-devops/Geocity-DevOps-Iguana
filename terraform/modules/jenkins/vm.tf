resource "google_compute_instance" "vm_instance" {
  name                = "${var.env}-${var.region}-${var.app}-jenkins"
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
    device_name = "${var.env}-${var.region}-${var.app}-disk-jenkis"
    source      = google_compute_disk.disk_jenkins.id
  }

  metadata_startup_script = file("${path.module}/startup.sh")

  metadata = {
    ssh-keys = "${var.env}-${var.region}-${var.app}-jenkins:${tls_private_key.ssh_key_jenkins.public_key_openssh}"
  }

  labels = {
    env = var.env
    app = var.app
  }
}

resource "google_compute_address" "public_ip" {
  name = "${var.env}-${var.region}-${var.app}-jenkins-ip"
}
