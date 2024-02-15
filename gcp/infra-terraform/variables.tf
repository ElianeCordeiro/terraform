variable "project_id" {
  type = string
  default = "terraform-411821"
}

variable "region" {
  type = string
  default = "us-west1"
}

variable "vm_name"{
    type = string
    default = "vm-terraform"
}

variable "machine_type" {
  type = string
  default = "e2-micro"
}

variable "zone" {
  type = string
  default = "us-west1-b"
}

variable "image" {
  type = string
  default = "debian-cloud/debian-11"
}

variable "fw_name"{
    type = string
    default = "terraform-firewall"
}

variable "ports" {
  type = list 
  default = ["80"]
}