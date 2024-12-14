provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "custom_vpc" {
  name = var.vpc_name
}

resource "google_compute_subnetwork" "general_subnet" {
  name          = var.general_subnet_name
  ip_cidr_range = var.general_subnet_cidr
  region        = var.region
  network       = google_compute_network.custom_vpc.self_link
}

resource "google_container_cluster" "gke_cluster" {
  name               = var.gke_cluster_name
  location           = var.region
  network            = google_compute_network.custom_vpc.self_link
  subnetwork         = google_compute_subnetwork.general_subnet.self_link
  remove_default_node_pool = true

  node_pool {
    name               = "general-node-pool"
    initial_node_count = 1
    node_config {
      machine_type = "e2-medium"
      disk_size_gb = 50
    }
  }
}
