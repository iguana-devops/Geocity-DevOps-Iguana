resource "google_sql_database_instance" "postgres" {

  name                = "${var.app}-${var.env}-${var.region}-postgres"
  database_version    = "POSTGRES_15"
  deletion_protection = var.deletion_protection

  settings {
    edition                     = "ENTERPRISE"
    tier                        = "db-custom-1-3840"
    availability_type           = "ZONAL"
    disk_size                   = var.db_disk_size
    disk_autoresize             = true
    deletion_protection_enabled = var.deletion_protection

    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = true
      start_time                     = "01:00"
      transaction_log_retention_days = 7
    }
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.vpc_id
    }
    user_labels = {
      env = var.env
      app = var.app
    }
  }
  depends_on = [google_service_networking_connection.private_vpc_connection]
}

resource "google_sql_database" "database" {
  name     = "citizen-db"
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "users" {
  name     = "citizen-user"
  instance = google_sql_database_instance.postgres.name
  password = random_password.db_user_pass.result
}
