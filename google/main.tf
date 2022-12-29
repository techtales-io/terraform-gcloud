# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CONFIGURE GOOGLE CLOUD
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.42.1"
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
  source     = "./kms"
  location   = var.location
  project_id = var.project_id
}

module "project_iam" {
  depends_on = [
    module.api_services,
    module.service_accounts
  ]
  source     = "./project_iam"
  project_id = var.project_id
}

module "service_accounts" {
  depends_on = [
    module.api_services,
    module.kms,
    module.workload_identity
  ]
  source               = "./service_accounts"
  project_id           = var.project_id
  project_number       = var.project_number
  google_kms_key_rings = module.kms.google_kms_key_rings
}

module "workload_identity" {
  depends_on = [
    module.api_services
  ]
  source     = "./workload_identity"
  project_id = var.project_id
}
