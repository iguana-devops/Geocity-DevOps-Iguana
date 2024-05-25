################ VPC ################

output "vpc_network" {
  value = google_compute_network.vpc_network.self_link
}

output "vpc_network_name" {
  value = google_compute_network.vpc_network.name
}

output "vpc_network_id" {
  value = google_compute_network.vpc_network.id
}

output "sub_network" {
  value = google_compute_subnetwork.sub_network.self_link
}

output "public_ip" {
  value = google_compute_address.public_ip.address
}

