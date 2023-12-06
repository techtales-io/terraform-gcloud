# --------------------------------------------------------------------------------
# CONFIGURE KMS KEYRING AND KEYS
# --------------------------------------------------------------------------------

# add key for sops encryption / decryption
resource "google_kms_crypto_key" "github_action_sops" {
  name     = "github-action-sops"
  key_ring = google_kms_key_ring.home_infra.id
}

# bind workload identity pool to kms decryption key
resource "google_kms_crypto_key_iam_binding" "***REMOVED***_decrypt" {
  crypto_key_id = google_kms_crypto_key.github_action_sops.id
  role          = "roles/cloudkms.cryptoKeyDecrypter"
  members = [
    "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/github/attribute.repository/techtales-io/terraform-github",
    "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/github/attribute.repository/techtales-io/terraform-gcloud",
    "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/github/attribute.repository/techtales-io/terraform-gworkspace",
  ]
}
