# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CONFIGURE PRESETS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


locals {
  # configure service account bindings
  gworkspace_infra = concat(split(",", var.users), ["serviceAccount:${google_service_account.github_gworkspace_infra.email}"])

  # configure repositories for workload identity

  principal_set        = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/"
  principal_set_github = "${local.principal_set}github/attribute.repository/"


  github_kms = [
    "${local.principal_set_github}techtales-io/terraform-github",
  ]

}
