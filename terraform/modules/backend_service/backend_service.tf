resource "google_compute_health_check" "health_check" {
  name                = "${var.name}-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2

  tcp_health_check {
    port = "80"
  }
}

resource "google_compute_backend_service" "backend_service" {
  name        = "${var.name}-backend-service"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10

 backend {
    group = google_compute_instance_group.nginx-group.self_link
  }

  health_checks = [google_compute_health_check.health_check.self_link]
}