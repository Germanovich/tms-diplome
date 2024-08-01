resource "google_compute_network" "network" {
  project                 = var.google_project
  name                    = "${var.name}-network"
  auto_create_subnetworks = false
}