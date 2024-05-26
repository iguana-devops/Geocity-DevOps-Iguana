################ SERVICES ################

variable "services" {
  description = "A list of services to enable."
  type        = list(string)
  default = [
    "compute.googleapis.com",
    "servicenetworking.googleapis.com",
    "secretmanager.googleapis.com"
  ]
}

resource "google_project_service" "services" {
  for_each           = toset(var.services)
  service            = each.key
  disable_on_destroy = false
}

