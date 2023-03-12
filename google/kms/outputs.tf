# --------------------------------------------------------------------------------
# CONFIGURE OUTPUTS
# --------------------------------------------------------------------------------

output "google_kms_key_rings" {
  value = {
    home_infra = google_kms_key_ring.home_infra
  }
}
