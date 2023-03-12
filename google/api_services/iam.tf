# --------------------------------------------------------------------------------
# ENABLE API
# --------------------------------------------------------------------------------

# IAM
# For Workload Identity Pools

resource "google_project_service" "iam" {
  project = var.project_id
  service = "iam.googleapis.com"
}
