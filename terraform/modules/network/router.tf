resource "google_compute_router" "router" {
  project = var.google_project
  name    = "${var.name}-router"
  network = google_compute_network.network.name
  region  = var.google_region
}