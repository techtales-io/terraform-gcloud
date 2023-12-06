# --------------------------------------------------------------------------------
# CONFIGURE PROVIDERS
# --------------------------------------------------------------------------------

provider "google" {
  project = local.project_id
  region  = local.location
  zone    = local.zone
}
