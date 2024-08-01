output "network" {
  description = "VPC network"
  value = google_compute_network.network.id
}
output "subnetwork1" {
  description = "Subnetwork to compute instance 1"
  value = google_compute_subnetwork.private1.id
}