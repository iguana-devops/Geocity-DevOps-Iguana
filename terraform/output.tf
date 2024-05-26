################ MAIN ################

output "Jenkins_public_ip" {
  value = module.vpc.public_ip
}

output "db_user_pass" {
  value = module.secret.db_user_pass
  sensitive = true
}

output "database_private_ip" {
  value = module.database.database_private_ip[0].ip_address
}

output "load_balancer_ip" {
  value = module.load_balancer.load_balancer_public_ip
}
