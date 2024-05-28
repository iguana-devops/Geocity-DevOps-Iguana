################ AUTO_SCALE ################

output "instance_group" {
  value = google_compute_instance_group_manager.geo.instance_group
}

output "health_check_id" {
  value = google_compute_region_health_check.backend.id
}