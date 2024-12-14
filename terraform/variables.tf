variable "project_id" {
  description = "The Google Cloud project ID"
  default     = "codimite-assesment"  # Set your project ID here
}

variable "region" {
  description = "The region where resources will be deployed"
  default     = "us-central1"
}

variable "vpc_name" {
  description = "The name of the VPC"
  default     = "custom-vpc"
}

variable "general_subnet_name" {
  description = "The name of the general subnet"
  default     = "general-subnet"
}

variable "general_subnet_cidr" {
  description = "The CIDR block for the general subnet"
  default     = "10.0.0.0/24"
}

variable "gke_cluster_name" {
  description = "The name of the GKE cluster"
  default     = "gke-cluster"
}
