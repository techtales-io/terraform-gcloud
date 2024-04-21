# --------------------------------------------------------------------------------
# CONFIGURE SERVICE ACCOUNT
# --------------------------------------------------------------------------------

locals {
  gworkspace_infra = concat(split(",", var.users))
}

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
  members            = local.gworkspace_infra
}

# grant service account impersonation members token creator
resource "google_service_account_iam_binding" "gworkspace_infra_serviceAccountTokenCreator" {
  service_account_id = google_service_account.gworkspace_infra.id
  role               = "roles/iam.serviceAccountTokenCreator"
  members = concat(local.gworkspace_infra, [
    "serviceAccount:${google_service_account.atlantis.email}",
    "serviceAccount:${google_service_account.gworkspace_infra.email}",
  ])
}
