# Create VPC
resource "google_compute_network" "vpc_network" {
  depends_on = [google_project_service.compute_api]
  name       = var.vpc_name
}

# Create Subnet
resource "google_compute_subnetwork" "subnet" {
  depends_on = [google_compute_network.vpc_network]
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = "us-central1" # Match the cluster's region
  network       = google_compute_network.vpc_network.id
}

# Create GKE Zonal Cluster
resource "google_container_cluster" "primary" {
  depends_on = [google_project_service.container_api]
  name       = var.gke_cluster_name
  location   = "us-central1-a" # Match the subnet's region
  network    = google_compute_network.vpc_network.id
  subnetwork = google_compute_subnetwork.subnet.id
  remove_default_node_pool = true
  initial_node_count = 1

  ip_allocation_policy {}

  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  deletion_protection = false # Ensure cluster can be destroyed if needed
}

# General Purpose Node Pool
resource "google_container_node_pool" "general" {
  depends_on = [google_container_cluster.primary]
  name       = var.general_node_pool_name
  cluster    = google_container_cluster.primary.name
  location   = "us-central1-a"
  node_count = 1 # Minimal resources to fit within quotas

  node_config {
    machine_type = "e2-micro" # Lowest resource machine type
    disk_size_gb = 20         # Minimal disk size
    disk_type    = "pd-standard"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 2 # Restricted to fit within quota
  }
}

# CPU-Intensive Node Pool
resource "google_container_node_pool" "cpu_intensive" {
  depends_on = [google_container_cluster.primary]
  name       = var.cpu_node_pool_name
  cluster    = google_container_cluster.primary.name
  location   = "us-central1-a"
  node_count = 1 # Minimal resources to fit within quotas

  node_config {
    machine_type = "e2-small" # Minimal machine type
    disk_size_gb = 20         # Minimal disk size
    disk_type    = "pd-standard"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 2 # Restricted to fit within quota
  }
}
