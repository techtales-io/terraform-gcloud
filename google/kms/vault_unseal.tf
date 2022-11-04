# --------------------------------------------------------------------------------
# CONFIGURE VAULT UNSEAL KEY
# --------------------------------------------------------------------------------

resource "google_kms_crypto_key" "vault_unseal_key" {
  depends_on = [
    google_kms_key_ring.vault_unseal
  ]
  name     = "vault-unseal-key"
  key_ring = google_kms_key_ring.vault_unseal.id
  # rotation_period = "86400s" # 1 day

  lifecycle {
    prevent_destroy = true
  }
}