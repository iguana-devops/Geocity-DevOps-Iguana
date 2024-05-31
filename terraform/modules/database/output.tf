output "database_private_ip" {
  value = google_sql_database_instance.postgres.ip_address[0].ip_address
}

output "database_pass" {
  value     = random_password.db_user_pass.result
  sensitive = true
}