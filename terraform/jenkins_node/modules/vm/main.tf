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
    device_name = "disk_jenkis"
    source      = google_compute_disk.disk_jenkins.id
  }

  metadata_startup_script = file("${path.module}/startup.sh")

  metadata = {
    ssh-keys = "${var.instance_name}:${tls_private_key.ssh_key_jenkins.public_key_openssh}"
  }

  labels = {
    environment = var.environment
  }
}

############# DISK ##############
resource "google_compute_disk" "disk_jenkins" {
  name        = "disk-jenkins"
  description = "Disk for Jenkins config"
  type        = var.disk_type
  size        = var.disk_size
  labels = {
    environment = var.environment
  }
}

resource "google_compute_resource_policy" "daily_snapshot_policy" {
  name        = "daily-snapshot-policy"
  description = "Snapshot policy once per day"
  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "00:00"
      }
    }
    retention_policy {
      max_retention_days    = 7
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }
    snapshot_properties {
      labels = {
        environment = var.environment
        snapshot    = "jenkins"
      }
    }
  }
}

resource "google_compute_disk_resource_policy_attachment" "attachment" {
  name = google_compute_resource_policy.daily_snapshot_policy.name
  disk = google_compute_disk.disk_jenkins.name
}

############# SECRET ##############
resource "tls_private_key" "ssh_key_jenkins" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "google_secret_manager_secret" "ssh_key_jenkins" {
  secret_id = "ssh_key_jenkins"

  labels = {
    environment = var.environment
    resource    = "jenkins_vm"
  }

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "ssh_key_jenkins_version" {
  secret      = google_secret_manager_secret.ssh_key_jenkins.id
  secret_data = tls_private_key.ssh_key_jenkins.private_key_openssh
}