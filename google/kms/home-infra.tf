# --------------------------------------------------------------------------------
# CONFIGURE KMS KEYRING AND KEYS
# --------------------------------------------------------------------------------

# add keyring
resource "google_kms_key_ring" "home_infra" {
  name     = "home-infra"
  project  = var.project_id
  location = var.location
}
