# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CONFIGURE PRESETS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


locals {

  # configure repositories for workload identity

  principal_set        = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/"
  principal_set_github = "${local.principal_set}github/attribute.repository/"


  github_kms = [
    "${local.principal_set_github}techtales-io/terraform-github",
  ]

}
