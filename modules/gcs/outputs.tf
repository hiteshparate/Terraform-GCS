output "bucket_url" {
  value = google_storage_bucket.gcs.url
}


output "bucket_name" {
  value = google_storage_bucket.gcs.name
}
