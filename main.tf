terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
project = "blaqbydesign"
region = "us-central1"
zone = "us-central1-a"
credentials = "blaqbydesign-a579fd22b70e.json"

}
resource "google_storage_bucket" "blaq-truckin" {
  name          = "this-big-truck-will-run-you-over"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}