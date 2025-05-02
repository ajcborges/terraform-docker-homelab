#################################
# Terraform Version & Providers
#################################

terraform {
  required_version = ">= 1.3.3"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.4.0"  # Allow patch updates like 3.4.x
    }
  }

  backend "local" {}
}

# Docker provider config
provider "docker" {
  host = var.docker_host
}
