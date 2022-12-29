# --------------------------------------------------------------------------------
# CONFIGURE GITHUB SA FOR GOOGLE GCLOUD INFRA
# --------------------------------------------------------------------------------

# create gcp service account
resource "google_service_account" "github_gcloud_infra" {
  account_id   = "***REMOVED***"
  display_name = "***REMOVED***"
  description  = "bound to github workload-identity-pool, terraform-managed"
  project      = var.project_id
}

# add role to gcp service account: see project_iam_roles/locals.tf
# resource "google_project_iam_binding"

# bind gcp service account to workload identity pool for specific github repositories
resource "google_service_account_iam_binding" "github_gcloud_infra_workloadidentity" {
  depends_on = [
    google_service_account.github_gcloud_infra
  ]
  service_account_id = google_service_account.github_gcloud_infra.id
  role               = "roles/iam.workloadIdentityUser"
  members            = local.github_gcloud_infra
}
