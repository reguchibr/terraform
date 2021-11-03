terraform {
  required_version = ">= 0.15.3"
  required_providers {
    google = ">= 3.69.0"
  }
  backend "gcs" {
    bucket = "tembici12345"
    #prefix = "terraform/foundation"
  }
}