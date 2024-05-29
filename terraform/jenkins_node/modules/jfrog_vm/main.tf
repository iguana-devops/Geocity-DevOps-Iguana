############## VM ##############
resource "google_compute_instance" "vm_instance" {
  name                = var.instance_name
  machine_type        = var.instance_type
  deletion_protection = var.deletion_protection

  boot_disk {
    initialize_params {
      image = "${var.image_project}/${var.image_family}"
    }
  }

  network_interface {
    network    = var.vpc_network
    subnetwork = var.sub_network

    access_config {
      nat_ip = google_compute_address.public_ip.address
    }
  }


  metadata_startup_script = file("${path.module}/metadata/startup.sh")

  metadata = {
    ssh-keys = "${var.instance_name}:${tls_private_key.ssh_key_jfrog.public_key_openssh}"
  }

  labels = {
    environment = var.environment
  }
}

############# PUBLIC_IP ##############
resource "google_compute_address" "public_ip" {
  name = "jfrog-public-address"
}


############# SECRET ##############
resource "tls_private_key" "ssh_key_jfrog" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "google_secret_manager_secret" "ssh_key_jfrog" {
  secret_id = "ssh_key_jfrog"

  labels = {
    environment = var.environment
    resource    = "jfrog_vm"
  }

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "ssh_key_jfrog_version" {
  secret      = google_secret_manager_secret.ssh_key_jfrog.id
  secret_data = tls_private_key.sssh_key_jfrog.private_key_openssh
}
