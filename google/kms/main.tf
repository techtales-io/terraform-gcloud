# --------------------------------------------------------------------------------
# CONFIGURE KMS KEYRINGS
# --------------------------------------------------------------------------------


# add keyring for home-infra
resource "google_kms_key_ring" "home_infra" {
  name     = "home-infra"
  project  = var.project_id
  location = var.location
}

resource "google_kms_key_ring" "vault_unseal" {
  name     = "vault-unseal"
  project  = var.project_id
  location = var.location
}
