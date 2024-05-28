################ NETWORK ################

output "vpc_network" {
  value = google_compute_network.vpc_network.self_link
}

output "sub_network" {
  value = google_compute_subnetwork.sub_network.self_link
}
