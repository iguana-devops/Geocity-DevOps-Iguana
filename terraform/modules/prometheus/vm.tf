resource "google_compute_instance" "prometheus_instance" {
  name                = "${var.env}-${var.region}-${var.app}-prometheus"
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
    device_name = "${var.env}-${var.region}-${var.app}-disk-prometheus"
    source      = google_compute_disk.disk_prometheus.id
  }

  metadata_startup_script = file("${path.module}/mon_prom_startup.sh")

  metadata = {
    ssh-keys = "${var.env}-${var.region}-${var.app}-prometheus:${tls_private_key.ssh_key_prometheus.public_key_openssh}"
  }

  labels = {
    env = var.env
    app = var.app
  }
}

resource "google_compute_address" "public_ip" {
  name = "${var.env}-${var.region}-${var.app}-prometheus-ip"
}