# --------------------------------------------------------------------------------
# CONFIGURE GOOGLE CLOUD
# --------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.5.0, <= 1.5.7"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.8.0"
    }
  }
}

module "api_services" {
  source     = "./api_services"
  project_id = var.project_id
}

module "kms" {
  depends_on = [
    module.api_services,
  ]
  source         = "./kms"
  location       = var.location
  project_id     = var.project_id
  project_number = var.project_number
}

module "project_iam" {
  depends_on = [
    module.api_services,
  ]
  source         = "./project_iam"
  project_id     = var.project_id
  project_number = var.project_number
}

module "service_accounts" {
  depends_on = [
    module.api_services,
    module.workload_identity
  ]
  source         = "./service_accounts"
  project_id     = var.project_id
  project_number = var.project_number
  users          = var.users
}

module "workload_identity" {
  depends_on = [
    module.api_services
  ]
  source     = "./workload_identity"
  project_id = var.project_id
}
