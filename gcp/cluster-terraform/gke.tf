#Criação do cluster GKE

resource "google_container_cluster" "eliane_cluster" {
  name = sensitive("${var.project_id}-gke")
  location = var.region

  # Não se pode criar um cluster sem um node pool definido, então como iremos utilizar node pool gerenciados separadamente,
  # criamos o menor node pool possível e imediatamente o deletamos.
  remove_default_node_pool = true
  initial_node_count = 1

  network = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  master_auth{

    # Whether client certificate authorization is enabled for this cluster. 
    #Cluster emitir ou não certificado de cliente para autenticação
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  deletion_protection = false
}

#Node pool gerenciado separadamente

resource "google_container_node_pool" "primary_nodes" {
    name = "${google_container_cluster.eliane_cluster.name}-node-pool"
    location = var.region
    cluster = google_container_cluster.eliane_cluster.name
    node_count = var.gke_num_nodes
    
    node_config {
      oauth_scopes = [
        "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      ]

      labels = {
        env = sensitive(var.project_id)
      }

      disk_size_gb = 10
      machine_type = "e2-standard-2"
      tags = ["gke-noe", sensitive("${var.project_id}-gke")]
      metadata = {
        disable-legacy-endpoints = "true"
      }
    }
}
