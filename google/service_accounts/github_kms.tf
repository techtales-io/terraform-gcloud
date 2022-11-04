# --------------------------------------------------------------------------------
# CONFIGURE GITHUB SA FOR KMS DECRYPTION
# --------------------------------------------------------------------------------

# create gcp service account
resource "google_service_account" "***REMOVED***" {
  account_id   = "***REMOVED***"
  display_name = "***REMOVED***"
  description  = "bound to github workload-identity pool"
  project      = var.project_id
}

# add key for sops encryption / decryption
resource "google_kms_crypto_key" "github_action_sops" {
  name     = "github-action-sops"
  key_ring = var.google_kms_key_rings.home_infra.id
  # rotation_period = "86400s" # 1 day

  lifecycle {
    prevent_destroy = true
  }
}

# bind service account to kms decryption key
resource "google_kms_crypto_key_iam_member" "***REMOVED***_decrypt" {
  depends_on = [
    google_service_account.***REMOVED***
  ]
  crypto_key_id = google_kms_crypto_key.github_action_sops.id
  role          = "roles/cloudkms.cryptoKeyDecrypter"
  member        = "serviceAccount:${google_service_account.***REMOVED***.email}"
}

# bind gcp service account to workload identity pool for specific github repositories
resource "google_service_account_iam_binding" "***REMOVED***_workloadidentity" {
  depends_on = [
    google_service_account.***REMOVED***
  ]
  service_account_id = google_service_account.***REMOVED***.id
  role               = "roles/iam.workloadIdentityUser"

  # add repositories here
  members = [
    "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/github/attribute.repository/techtales-io/terraform-github"
  ]
}
