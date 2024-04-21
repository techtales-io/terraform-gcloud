# --------------------------------------------------------------------------------
# CONFIGURE SERVICE ACCOUNT
# --------------------------------------------------------------------------------

# create gcp service account
resource "google_service_account" "atlantis" {
  account_id   = "atlantis"
  display_name = "atlantis"
  description  = "atlantis service account for gcloud interaction, terraform-managed"
  project      = var.project_id
}

# create key for usage within atlantis
resource "google_service_account_key" "atlantis" {
  service_account_id = google_service_account.atlantis.name
}

# write to vault
resource "vault_generic_secret" "atlantis_service_account_key" {
  path = "infra/kubernetes/atlantis"

  data_json = jsonencode({
    credentials = base64decode(google_service_account_key.atlantis.private_key)
  })
}
