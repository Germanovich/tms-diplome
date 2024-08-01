resource "google_compute_firewall" "allow-http" {
  name    = "${var.name}-allow-http"
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.tags_firewall["tag1"]]
}

resource "google_compute_firewall" "allow-https" {
name    = "${var.name}-allow-https"
network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

 source_ranges = ["0.0.0.0/0"]
 target_tags = [ var.tags_firewall["tag2"] ]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.name}-allow-ssh"
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.tags_firewall["tag3"]]
}
