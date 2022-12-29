# --------------------------------------------------------------------------------
# CONFIGURE GITHUB SA FOR KMS DECRYPTION
# --------------------------------------------------------------------------------

# create gcp service account
resource "google_service_account" "github_action_kms" {
  account_id   = "github-action-kms"
  display_name = "github-action-kms"
  description  = "bound to github workload-identity pool, terraform-managed"
  project      = var.project_id
}

# add key for sops encryption / decryption
resource "google_kms_crypto_key" "github_action_sops" {
  name     = "github-action-sops"
  key_ring = var.google_kms_key_rings.home_infra.id
}

# bind service account to kms decryption key
resource "google_kms_crypto_key_iam_member" "github_action_kms_decrypt" {
  crypto_key_id = google_kms_crypto_key.github_action_sops.id
  role          = "roles/cloudkms.cryptoKeyDecrypter"
  member        = "serviceAccount:${google_service_account.github_action_kms.email}"
}

# bind gcp service account to workload identity pool for specific github repositories
resource "google_service_account_iam_binding" "github_action_kms_workloadidentity" {
  service_account_id = google_service_account.github_action_kms.id
  role               = "roles/iam.workloadIdentityUser"
  members            = local.github_kms
}
