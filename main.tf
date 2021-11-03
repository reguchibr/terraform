provider "google" {
    project = var.project_id
    region = "us-central1"
    zone = "us-central1-c"
}
resource "google_compute_network" "vpc" {
  name                    = "${local.environments}-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = "${local.environments}-subnet1"
  ip_cidr_range = "${local.cidr}"
  network       = google_compute_network.vpc.id
  region        = "${var.region}"
}