output "gke_cluster_name" {
  description = "The name of the GKE cluster"
  value       = google_container_cluster.primary.name
}

output "gke_cluster_endpoint" {
  description = "The endpoint of the GKE cluster"
  value       = google_container_cluster.primary.endpoint
}

output "gke_cluster_ca_certificate" {
  description = "The CA certificate of the GKE cluster"
  value       = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
}

output "gcr_registry_url" {
  description = "The Google Container Registry URL"
  value       = "gcr.io/${var.project_id}"
}
