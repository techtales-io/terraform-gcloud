# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CONFIGURE ROLE MEMBERSHIPS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

locals {
  serviceaccount_suffix = "@${var.project_id}.iam.gserviceaccount.com"

  roles = {
    # github action for gcloud infra
    "serviceAccount:github-gcloud-infra${local.serviceaccount_suffix}" = [
      "roles/cloudkms.admin",
      "roles/iam.serviceAccountAdmin",
      "roles/iam.serviceAccountKeyAdmin",
      "roles/iam.workloadIdentityPoolAdmin",
      "roles/resourcemanager.projectIamAdmin",
      "roles/run.developer",
      "roles/serviceusage.serviceUsageViewer",
    ]
  }

  all_roles = sort(distinct(flatten([
    for group, roles in local.roles : roles]
  )))
}
