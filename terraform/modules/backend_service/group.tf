resource "google_compute_instance_group" "nginx-group" {
  name      = "${var.name}-nginx-group"
  zone      = var.google_zone
  instances = [
    google_compute_instance.nginx-instance.self_link
    ]

  named_port {
    name = "http"
    port = "80"
  }

  named_port {
    name = "https"
    port = "443"
  }
}