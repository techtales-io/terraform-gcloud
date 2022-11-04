output "google_kms_key_rings" {
  value = {
    home_infra   = google_kms_key_ring.home_infra
    vault_unseal = google_kms_key_ring.vault_unseal
  }
}
