resource "google_compute_instance" "nginx-instance" {
  name         = "${var.name}-nginx-instance"
  machine_type = var.machine_type
  project      = var.google_project
  zone         = var.google_zone

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }

  tags = [
    var.tags_firewall["tag1"],
    var.tags_firewall["tag2"],
    var.tags_firewall["tag3"]
  ]

  metadata_startup_script = file(var.nginx_script)

  network_interface {
    network = var.network
    subnetwork = var.subnetwork1
  }
}
