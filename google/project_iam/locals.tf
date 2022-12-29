# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CONFIGURE ROLE MEMBERSHIPS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

locals {
  serviceaccount_suffix = "@${var.project_id}.iam.gserviceaccount.com"

  roles = {
    # github action for gcloud infra
    "serviceAccount:***REMOVED***${local.serviceaccount_suffix}" = [
      "roles/cloudkms.admin",
      "roles/run.developer",
      "roles/iam.workloadIdentityPoolAdmin",
      "roles/resourcemanager.projectIamAdmin",
      "roles/iam.serviceAccountAdmin",
      "roles/iam.serviceAccountKeyAdmin",
    ]
  }

  all_roles = sort(distinct(flatten([
    for group, roles in local.roles : roles]
  )))
}
