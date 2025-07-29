#################################
# Terraform Version & Providers.
#################################

terraform {
  required_version = ">= 1.3.3"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }
  }

  backend "gcs" {
    bucket = "tf-homelab-backend"
    prefix = "containers/codeserver/tfstate/production.tfstate"
  }
}

# Docker provider config
provider "docker" {
  host     = var.docker_host
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}
