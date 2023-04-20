module "GCS" {
  source      = "./modules/gcs"
  bucket_name = var.bucket_name
  location    = var.location

}

resource "google_storage_bucket_object" "name" {
  bucket = module.GCS.bucket_name
  name   = "object1"
  source = "./hcltech.jpg"


}

resource "google_compute_network" "VPC" {
  name                    = "custom-vpc"
  auto_create_subnetworks = true
}
