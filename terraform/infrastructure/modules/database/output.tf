################ DATABASE ################

output "database_private_ip" {
  value = google_sql_database_instance.master.ip_address
}