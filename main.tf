# --------------------------------------------------------------------------------
# CONFIGURE TERRAFORM
# --------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.5.0, <= 1.5.7"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.8.0"
    }
  }
  backend "s3" {
    bucket                      = "terraform"
    key                         = "techtales/gcloud/terraform.tfstate"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  }
}

module "google" {
  source         = "./google"
  location       = var.location
  project_id     = var.project_id
  project_number = var.project_number
  users          = var.users
}
