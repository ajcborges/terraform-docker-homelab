terraform {
  required_version = ">= 1.3.3"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.4.0"  ## Allow patch updates like 3.4.x
    }
  }

  backend "local" {}
}

# Docker provider config
provider "docker" {
  host     = "ssh://ajcborges@whitewalker:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "hello" {
  name  = "hello-nginx"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8080
  }
}

