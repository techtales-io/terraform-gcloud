# --------------------------------------------------------------------------------
# CONFIGURE ROLE MEMBERSHIPS
# --------------------------------------------------------------------------------

locals {
  # serviceaccount_suffix = "@${var.project_id}.iam.gserviceaccount.com"
  principal_set_github = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/github/attribute.repository"

  roles = {
    # github action for gcloud infra
    "${local.principal_set_github}/techtales-io/terraform-gcloud" = [
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
