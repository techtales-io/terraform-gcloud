# --------------------------------------------------------------------------------
# CONFIGURE VARIABLES
# --------------------------------------------------------------------------------

variable "location" {
  description = "preferred region for gcloud resources"
  type        = string
}

variable "zone" {
  description = "preferred zone for gcloud resources"
  type        = string
}

variable "project_id" {
  description = "gcloud project id"
  type        = string
}

variable "project_number" {
  description = "gcloud project number"
  type        = string
}

variable "users" {
  description = "list of users eligible for gworkspace maintenance"
  type        = string
}
