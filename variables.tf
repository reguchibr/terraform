variable project_id {
    description = "GCP project id"
    type        = string
    default     = "github-330819"
}

variable region {
    description = "GCP region"
    type        = string
    default     = "us-central1"
}

variable "workspace_to_env" {
  description = "environments"
  type = map
  default = {
    development     = "dev"
    homolog         = "qa"
    production      = "prod"
  }
}

variable "workspace_to_cidr" {
  description = "vpc cidr"
  type = map
  default = {
    development     = "10.0.1.0/24"
    homolog         = "10.0.2.0/24"
    production      = "10.0.3.0/24"
  }
}

locals {
 # or even better if you don't need the default
  cidr = var.workspace_to_cidr[terraform.workspace]
  environments = var.workspace_to_env[terraform.workspace]
}
