module "container" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ref=container/2.0.0"

  image          = "ghcr.io/gethomepage/homepage:v1.3.2"
  container_name = "homepage2"
  hostname       = "homepage"
  restart_policy = "unless-stopped"
  environment = {
    PUID = "1000"
    GUID = "1000"
    TZ   = "Australia/Melbourne"
    HOMEPAGE_ALLOWED_HOSTS = var.homepage_allowed_hosts
  }

  # Ports configuration
  # Note: Homepage uses port 3000 by default.
  # Ensure that the external port does not conflict with other services.
  
  ports = [{
    external = "3999"
    internal = "3000"
    protocol = "tcp"
  }]

  host_paths = {
    "/srv/share/containers/homepage2/config/" = {
      container_path = "/app/config/"
      read_only      = false
    },
    "/var/run/docker.sock" = {
      container_path = "/var/run/docker.sock"
      read_only      = true

    }

  }
}

