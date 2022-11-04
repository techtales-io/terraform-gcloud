# --------------------------------------------------------------------------------
# CONFIGURE WORKLOAD IDENTITY POOL FOR GITHUB ACTIONS
# --------------------------------------------------------------------------------

resource "google_iam_workload_identity_pool" "github" {
  workload_identity_pool_id = "github"
  display_name              = "github"
  description               = "Identity pool for github"
  project                   = var.project_id
  disabled                  = false
}

resource "google_iam_workload_identity_pool_provider" "github_oidc_provider" {
  depends_on = [
    google_iam_workload_identity_pool.github
  ]
  workload_identity_pool_id          = google_iam_workload_identity_pool.github.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-oidc-provider"
  display_name                       = "github-oidc-provider"
  description                        = "OIDC identity pool provider for github"
  project                            = var.project_id
  disabled                           = false
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}
