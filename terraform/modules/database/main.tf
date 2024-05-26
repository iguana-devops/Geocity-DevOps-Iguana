############# DATABASE ##############

resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "master" {

  name                = "${var.db_instance_name}-${random_id.db_name_suffix.hex}"
  database_version    = "POSTGRES_15"
  region              = var.region
  deletion_protection = false

  settings {
    tier              = "db-custom-1-3840" # 1 CPU 3 RAM
    availability_type = "ZONAL"
    disk_autoresize   = true
    disk_size         = 10
    edition = "ENTERPRISE"

    backup_configuration {
      enabled    = true
      start_time = "01:00"
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
  password = var.db_user_pass
}