variable "project_id" {
  type = string
  default = "terraform-411821"
  description = "project id"
}

variable "region" {
  type = string
  default = "us-central1"
  description = "region"
}

#Variáveis do GKE

variable "gke_username" {
  default = ""
  description = "user do gke"
}

variable "gke_password" {
  default = ""
  description = "password do gke"
}

variable "gke_num_nodes" {
  default = 2
  description = "numero de nodes para o cluster"
}


