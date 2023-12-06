# --------------------------------------------------------------------------------
# CONFIGURE GWORKSPACE SA FOR GROUPS AND USERS
# --------------------------------------------------------------------------------

# create gcp service account
resource "google_service_account" "gworkspace_infra" {
  account_id   = "gworkspace-infra"
  display_name = "gworkspace-infra"
  description  = "domain-wide delegation in gworkspace, terraform-managed"
  project      = var.project_id
}

# bind gcp service account impersonation
resource "google_service_account_iam_binding" "gworkspace_infra_serviceAccountUser" {
  service_account_id = google_service_account.gworkspace_infra.id
  role               = "roles/iam.serviceAccountUser"
  members = [
    "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/github/attribute.repository/techtales-io/terraform-gworkspace",
    "user:***REMOVED***",
    "user:***REMOVED***",
  ]
}

# grant service account impersonation members token creator
resource "google_service_account_iam_binding" "gworkspace_infra_serviceAccountTokenCreator" {
  service_account_id = google_service_account.gworkspace_infra.id
  role               = "roles/iam.serviceAccountTokenCreator"
  members = [
    "serviceAccount:${google_service_account.gworkspace_infra.email}",
    "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/github/attribute.repository/techtales-io/terraform-gworkspace",
    "user:***REMOVED***",
    "user:***REMOVED***",
  ]
}
