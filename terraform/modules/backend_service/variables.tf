variable "google_project" {
  description = "Project id"
  type = string
}
variable "google_region" {
  description = "Region name"
  type = string
}
variable "google_zone" {
  description = "The zone where the instances will be created"
  type        = string
}
variable "name" {
    description = "Name of the project"
    type = string
}

variable "nginx_script" {
  description = "startup nginx script for instance"
  type = string
}

variable "tags_firewall" {
  type = map(string)
}

variable "network" {

}
variable "subnetwork1" {

}
variable "machine_type" {
  description = "Machine type"
  type = string
  default = "e2-micro"
}
variable "instance_image" {
  description = "Instance image"
  type = string
  default = "debian-cloud/debian-10"
}