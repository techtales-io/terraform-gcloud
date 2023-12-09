# --------------------------------------------------------------------------------
# CONFIGURE TERRAFORM
# --------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.5.0, <= 1.6.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.8.0"
    }
  }
}

# add keyring
resource "google_kms_key_ring" "home_infra" {
  name     = "home-infra"
  project  = var.project_id
  location = var.location
}
