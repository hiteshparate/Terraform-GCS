resource "google_storage_bucket" "gcs" {
  name                     = var.bucket_name
  location                 = var.location
  force_destroy            = true
  public_access_prevention = "enforced"
  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }

  }

  lifecycle_rule {
    condition {
      age = 2
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      created_before = "2023-04-21"
    }
    action {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }
  }
}
