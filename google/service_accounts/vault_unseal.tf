# --------------------------------------------------------------------------------
# CONFIGURE SA FOR VAULT UNSEAL
# --------------------------------------------------------------------------------

# create gcp service account
resource "google_service_account" "vault_unseal" {
  account_id   = "vault-unseal"
  display_name = "vault-unseal"
  description  = "terraform-managed"
  project      = var.project_id
}

# add key for sops encryption / decryption
resource "google_kms_crypto_key" "vault_unseal" {
  name     = "vault-unseal"
  key_ring = var.google_kms_key_rings.home_infra.id
}

# bind service account to kms key
resource "google_kms_crypto_key_iam_member" "vault_unseal_kms_encryptdecrypt" {
  crypto_key_id = google_kms_crypto_key.vault_unseal.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${google_service_account.vault_unseal.email}"
}

resource "google_kms_crypto_key_iam_member" "vault_unseal_kms_viewer" {
  crypto_key_id = google_kms_crypto_key.vault_unseal.id
  role          = "roles/cloudkms.viewer"
  member        = "serviceAccount:${google_service_account.vault_unseal.email}"
}
