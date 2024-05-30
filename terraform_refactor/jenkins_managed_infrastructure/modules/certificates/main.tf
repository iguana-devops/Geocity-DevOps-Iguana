######## CERTIFICATES ###########

resource "google_compute_region_ssl_certificate" "iguana" {
  name        = "ssl-certificate"
  private_key = data.google_secret_manager_secret_version.private_key.secret_data
  certificate = data.google_secret_manager_secret_version.certificate.secret_data
}

data "google_secret_manager_secret_version" "private_key" {
  secret = "privkey"
}

data "google_secret_manager_secret_version" "certificate" {
  secret = "fullchain"
}
