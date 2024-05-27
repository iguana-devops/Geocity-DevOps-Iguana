######## CERTIFICATES ###########

output "certificates_id" {
  value = google_compute_region_ssl_certificate.iguana.id
}