############# DATABASE ##############
resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "master" {

  name                = "db-postgres-${random_id.db_name_suffix.hex}"
  database_version    = var.database_version
  region              = var.region
  deletion_protection = var.db_deletion_protection

  settings {
    edition                     = var.db_edition
    tier                        = var.db_tier
    availability_type           = var.db_availability_type
    disk_size                   = var.db_disk_size
    disk_autoresize             = true
    deletion_protection_enabled = var.db_deletion_protection

    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = true
      start_time                     = "01:00"
      transaction_log_retention_days = 7
    }
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.vpc_network_id
    }
    user_labels = {
      environment = var.environment
    }
  }
}

resource "google_sql_database" "database" {
  name     = var.db_name
  instance = google_sql_database_instance.master.name
}

resource "google_sql_user" "users" {
  name     = var.db_user
  instance = google_sql_database_instance.master.name
  password = random_password.db_user_pass.result
}

############# SECRET ##############
resource "random_password" "db_user_pass" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "google_secret_manager_secret" "database_credentials" {
  secret_id = "database_credentials"

  labels = {
    environment = var.environment
    resource    = "citizen-db"
  }

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_password_version" {
  secret      = google_secret_manager_secret.database_credentials.id
  secret_data = random_password.db_user_pass.result
}