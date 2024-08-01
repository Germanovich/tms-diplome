resource "google_compute_global_address" "global_address" {
  name = "${var.name}-global-address"
}

resource "google_compute_url_map" "url_map" {
  name            = "${var.name}-url-map"
  default_service = var.backend_service
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "${var.name}-http-proxy"
  url_map = google_compute_url_map.url_map.self_link
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  name       = "${var.name}-forwarding-rule"
  ip_address = google_compute_global_address.global_address.address
  port_range = "80"
  target     = google_compute_target_http_proxy.http_proxy.self_link
}
