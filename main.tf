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

resource "google_storage_bucket" "bunda-001" {
  name          = "bundlesofboricuabunda"
  location      = "US-west2"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}