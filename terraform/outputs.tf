output "vpc_name" {
  value = google_compute_network.custom_vpc.name
}

output "general_subnet" {
  value = google_compute_subnetwork.general_subnet.name
}

output "gke_cluster_name" {
  value = google_container_cluster.gke_cluster.name
}
