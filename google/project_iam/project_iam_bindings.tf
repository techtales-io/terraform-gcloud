# --------------------------------------------------------------------------------
# CONFIGURE IAM BINDINGS
# --------------------------------------------------------------------------------


# add locals definitions to iam role binding
resource "google_project_iam_binding" "project_iam_binding" {
  for_each = toset(local.all_roles)
  project  = var.project_id
  role     = each.value

  members = [for group, roles in local.roles : group if contains(roles, each.value)]
}
