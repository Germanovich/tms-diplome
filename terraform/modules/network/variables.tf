variable "google_project" {
  description = "Project id"
  type = string
}
variable "google_region" {
  description = "Region name"
  type = string
}
variable "google_zone" {
  description = "Zone name"
  type = string
}
variable "name" {
    description = "Name of the project"
    type = string
}
variable "ip_subnetwork1" {
    description = "Ip ranges for ssh"
    type = string
}
variable "ip_subnetwork2" {
    description = "Ip ranges for http"
    type = string
}
variable "tags_firewall" {
  type = map(string)
}