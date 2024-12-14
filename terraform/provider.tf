provider "google" {
  project = var.project_id
  region  = var.region
}

# Enable Required APIs
resource "google_project_service" "compute_api" {
  project = var.project_id
  service = "compute.googleapis.com"
}

resource "google_project_service" "container_api" {
  project = var.project_id
  service = "container.googleapis.com"
}

resource "google_project_service" "container_registry_api" {
  project = var.project_id
  service = "containerregistry.googleapis.com"
}
