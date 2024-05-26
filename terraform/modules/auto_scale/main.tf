################ AUTO_SCALE ################

resource "google_compute_instance_group_manager" "rigm" {

  name = "website-rigm"
  version {
    instance_template = var.template_id
    name              = "primary"
  }
  base_instance_name = "internal-glb"
  target_size        = 1

  named_port {
    name = "http"
    port = 80
  }

}

resource "google_compute_autoscaler" "foobar" {
  name   = "my-autoscaler"
  target = google_compute_instance_group_manager.rigm.id

  autoscaling_policy {
    max_replicas    = 3
    min_replicas    = 1
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}

resource "google_compute_region_health_check" "backend" {

  name = "website-hc"
  http_health_check {
    port_specification = "USE_SERVING_PORT"
  }
}