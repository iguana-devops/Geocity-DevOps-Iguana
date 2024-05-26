############## LOAD_BALANCER ##############

output "load_balancer_public_ip" {
  value = google_compute_forwarding_rule.default.ip_address
}

