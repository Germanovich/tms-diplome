# resource "google_storage_bucket" "auto-expire" {
#   name     = var.google_project + "-bucket"
#   location = "US"
#   force_destroy = true
#
#   lifecycle_rule {
#     condition {
#       age = "3"
#     }
#     action {
#       type = "Delete"
#     }
#   }
#   lifecycle_rule {
#     condition {
#       age = "1"
#     }
#     action {
#       type = "AbortIncompleteMultipartUpload"
#     }
#   }
# }

module "network" {
  source = "modules/network"

  google_project = var.google_project
  google_region = var.google_region
  google_zone = var.google_region

  name = var.name

  ip_subnetwork1 = var.ip_subnetwork1
  ip_subnetwork2 = var.ip_subnetwork2

  tags_firewall = var.tags_firewall
}
module "backend_service" {
  source = "modules/backend_service"

  google_project = var.google_project
  google_region = var.google_region
  google_zone = var.google_zone

  name = var.name

  nginx_script = var.nginx_script

  depends_on = [ module.network ]
  network = module.network.network
  subnetwork1 = module.network.subnetwork1

  tags_firewall = var.tags_firewall
}
module "load_balancer" {
  source = "modules/load_balancer"

  google_project = var.google_project

  name = var.name

  backend_service = module.backend_service.backend_service
}