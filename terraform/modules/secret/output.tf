################ SECRET ################

output "db_user_pass" {
  value     = google_secret_manager_secret_version.db_password_version.secret_data
  sensitive = true
}


