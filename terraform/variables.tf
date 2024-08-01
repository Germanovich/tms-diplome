variable "google_project" {
  description = "Project id"
  type = string
  default = "terraform-tms-424012"
}
variable "google_region" {
  description = "Region name"
  type = string
  default = "us-east1"
}
variable "google_zone" {
  description = "Zone name"
  type = string
  default = "us-east1-c"
}
variable "name" {
  description = "name for project"
  default = "tms-terraform"
}
variable "nginx_script" {
  description = "startup nginx script for instance"
  default = "nginx.sh"
}
variable "ip_subnetwork1" {
  description = "range ip adresses for subnet1"
  default = "10.0.100.0/24"
}
variable "ip_subnetwork2" {
  description = "range ip adresses for subnet1"
  default = "10.0.101.0/24"
}
variable "tags_firewall" {
  description = "tags firewall rules to compute instance"
  type = map(string)
  default = {
    tag1 = "http-server"
    tag2 = "https-server" 
    tag3 = "ssh-server" 
  }
}