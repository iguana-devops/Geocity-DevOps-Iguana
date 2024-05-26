################ SECRET ################

output "db_user_pass" {
  value = google_secret_manager_secret_version.db_password_version.secret_data
  sensitive = true
}

output "ssh_key_jenkins" {
  value = tls_private_key.ssh_key_jenkins.private_key_openssh
  sensitive = true
}

output "ssh_key_jenkins_pub" {
  value = tls_private_key.ssh_key_jenkins.public_key_openssh
}