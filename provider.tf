terraform {
  required_providers {
    google = {
      version = ">=4.9.0"
      source  = "hashicorp/google"
    }
  }
  backend "gcs" {
    bucket = "bucket-1003934"
    prefix = "Terraform/state"

  }
}


provider "google" {
  project     = var.project
  credentials = file(var.credential_file)
  region      = "us-central1"
  zone        = "us-central1-a"
}

provider "google-beta" {
  alias       = "beta"
  project     = var.project
  credentials = file(var.credential_file)
  region      = "us-central1"
  zone        = "us-central1-a"
}
