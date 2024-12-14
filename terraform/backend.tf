terraform {
  backend "gcs" {
    bucket = "codimite-terraform-state"  
    prefix = "terraform/state"           
  }
}
