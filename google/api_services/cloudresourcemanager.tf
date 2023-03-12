# --------------------------------------------------------------------------------
# ENABLE API
# --------------------------------------------------------------------------------

# Resource Manager
# For Workload Identity Pools

resource "google_project_service" "cloudresourcemanager" {
  project = var.project_id
  service = "cloudresourcemanager.googleapis.com"
}
