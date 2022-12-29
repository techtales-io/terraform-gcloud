# --------------------------------------------------------------------------------
# CONFIGURE GITHUB SA FOR GOOGLE WORKSPACE INFRA
# --------------------------------------------------------------------------------

# create gcp service account
resource "google_service_account" "github_gworkspace_infra" {
  account_id   = "github-gworkspace-infra"
  display_name = "github-gworkspace-infra"
  description  = "bound to github workload-identity pool, terraform-managed"
  project      = var.project_id
}

# add role to gcp service account: see project_iam_roles/locals.tf
# resource "google_project_iam_binding"

# bind gcp service account to workload identity pool for specific github repositories
resource "google_service_account_iam_binding" "github_gworkspace_infra_workloadidentity" {
  depends_on = [
    google_service_account.github_gworkspace_infra
  ]
  service_account_id = google_service_account.github_gworkspace_infra.id
  role               = "roles/iam.workloadIdentityUser"
  members            = local.github_gworkspace_infra
}
