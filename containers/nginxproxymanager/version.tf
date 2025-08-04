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
    prefix = "containers/2fauth/tfstate/production.tfstate"
  }
}

# Docker provider config
provider "docker" {
  host     = "ssh://ajcborges@nightking:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}
