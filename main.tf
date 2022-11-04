# --------------------------------------------------------------------------------
# CONFIGURE TERRAFORM
# --------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.42.1"
    }
  }
  backend "s3" {
    endpoint                    = "https://nas.techtales.io:9000/"
    bucket                      = "terraform"
    key                         = "techtales/gcloud/terraform.tfstate"
    region                      = "home"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  }
}

module "google" {
  source   = "./google"
  location = "europe-west3"
  # zone           = "europe-west3-c"
  # project_name   = "techtales"
  project_id     = "techtales"
  project_number = "140059745414"
}
