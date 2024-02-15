# Criação de VPC

resource "google_compute_network" "vpc" {
  name = sensitive("${var.project_id}-vpc")
  auto_create_subnetworks = "false"
}

#Criação da subnet

resource "google_compute_subnetwork" "subnet" {
  name = sensitive("${var.project_id}-subnet")
  region = var.region
  network = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}

