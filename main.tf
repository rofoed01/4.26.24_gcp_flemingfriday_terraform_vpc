terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  project = "vpcpractice-march31"
  region = "us-west2"
  credentials = "vpcpractice-march31-ecfaaf3cb1ac.json"
  # Configuration options
}

resource "google_storage_bucket" "bunda-bucket-001" {
  name          = "bundlesofboricuabunda"
  location      = "US-west2"
  force_destroy = true

}


resource "google_compute_network" "bunda-vpc-001" {
  name = "bunda-vpc-001"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "bunda-sg-public" {
  name ="bunda-sg"
  network = google_compute_network.bunda-vpc-001.id
  ip_cidr_range = "10.118.1.0/24"
  region = "us-west2"
}


#resource "google_compute_network" "custom-vpc-tf" {
  #name = "custom-vpc-tf"
 #auto_create_subnetworks = false
#}

output "auto" {
  value = google_compute_network.bunda-vpc-001.id
}

#output "custom" {
#  value = google_compute_network.custom-vpc-tf.id
#}