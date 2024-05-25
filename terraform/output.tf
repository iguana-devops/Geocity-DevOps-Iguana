################ MAIN ################

output "vpc_network_name" {
  value = module.vpc.vpc_network_name
}

output "public_ip" {
  value = module.vpc.public_ip
}

output "database_private_ip" {
  value = module.database.database_private_ip
}