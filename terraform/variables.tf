variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "gcloud-assesment"
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-west1"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "gke-vpc"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "gke-subnet"
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "gke_cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "gke-cluster"
}

variable "general_node_pool_name" {
  description = "Name of the general-purpose node pool"
  type        = string
  default     = "general-pool"
}

variable "cpu_node_pool_name" {
  description = "Name of the CPU-intensive node pool"
  type        = string
  default     = "cpu-intensive-pool"
}

variable "general_machine_type" {
  description = "Machine type for general-purpose node pool"
  type        = string
  default     = "e2-medium"
}

variable "cpu_machine_type" {
  description = "Machine type for CPU-intensive node pool"
  type        = string
  default     = "e2-highcpu-8"
}

variable "node_count" {
  description = "Number of nodes per node pool"
  type        = number
  default     = 1
}
