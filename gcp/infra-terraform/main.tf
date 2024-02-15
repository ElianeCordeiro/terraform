#Configurar o projeto GCP

provider "google" {
  credentials = "${file("C:/Users/Eliane Cordeiro/Downloads/terraform-service-account.json")}"
  project = "${var.project_id}"
  region = "${var.region}"
}

# Cria a VM  com o Google Compute Engine

resource "google_compute_instance" "terraform" {
  name = "${var.vm_name}"
  machine_type = "${var.machine_type}"
  zone = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  #Instala o servidor web Apache
  metadata_startup_script = "sudo apt-get update; sudo apt-get installapache2 -y; echo Testando > /var/www/html/index.html"

  #Habilita rede para a VM bem como um IP público

  network_interface {
    network = "default"
    access_config {
      
    }
  }
}

#Cria o Firewall para a VM
resource "google_compute_firewall" "terrafirewall" {
  name = "${var.fw_name}"
  network = "default"
  

  allow {
    protocol = "tcp"
    ports = "${var.ports}"
  }

  
}