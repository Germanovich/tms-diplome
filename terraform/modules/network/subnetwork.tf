resource "google_compute_subnetwork" "private1" {
  name          = "${var.name}-private1"
  ip_cidr_range = var.ip_subnetwork1
  region        = var.google_region
  network       = google_compute_network.network.id

}