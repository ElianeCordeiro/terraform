resource "google_compute_instance" "first-terraform-vm" {
  name = "first-terraform-vm"
  machine_type = "e2-micro"
  zone = "us-central1-b"

  tags = [ "test", "dev" ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        environment = "test"
      }
    }
  }

    network_interface {
      network = google_compute_network.vpc-terraform.id

      access_config {
        // ephemeral public IP
      }
    }
}

resource "google_compute_network" "vpc-terraform" {
  name = "vpc-terraform"
  auto_create_subnetworks = true
}