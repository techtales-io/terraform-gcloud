# --------------------------------------------------------------------------------
# CONFIGURE PROVIDERS
# --------------------------------------------------------------------------------

provider "google" {
  project = var.project_id
  region  = var.location
  zone    = var.zone
}
