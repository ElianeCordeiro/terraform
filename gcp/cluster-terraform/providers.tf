provider "google" {
  credentials = "${file("C:/Users/Eliane Cordeiro/Downloads/terraform-service-account.json")}"
  project = "${var.project_id}"
  region = "${var.region}"
}