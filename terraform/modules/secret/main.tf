############# SECRET ##############

# Data Base pass
resource "random_password" "db_user_pass" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "google_secret_manager_secret" "database_credentials" {
  secret_id = "database_credentials"

  labels = {
    environment = var.environment
    label       = var.label_db
  }

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_password_version" {
  secret      = google_secret_manager_secret.database_credentials.id
  secret_data = random_password.db_user_pass.result
}

# SSH-key for Jenkins VM
resource "tls_private_key" "ssh_key_jenkins" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "google_secret_manager_secret" "ssh_key_jenkins" {
  secret_id = "ssh_key_jenkins"

  labels = {
    environment = var.environment
    label       = var.label_ssh_jenkins
  }

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "ssh_key_jenkins_version" {
  secret      = google_secret_manager_secret.ssh_key_jenkins.id
  secret_data = tls_private_key.ssh_key_jenkins.private_key_openssh
}
