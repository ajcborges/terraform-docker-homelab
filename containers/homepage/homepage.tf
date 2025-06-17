module "container" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ref=ba73b21"

  image          = "ghcr.io/gethomepage/homepage:v1.3.2"
  container_name = "homepage"
  hostname       = "homepage"
  restart_policy = "unless-stopped"
  environment = {
    PUID = "1000"
    GUID = "1000"
    TZ   = "Australia/Melbourne"
    HOMEPAGE_ALLOWED_HOSTS = "whitewalker:3003"
  }
  ports = [{
    external = "3003"
    internal = "3000"
    protocol = "tcp"
  }]


  host_paths = {
    "/mnt/citadel/homepage/" = {
      container_path = "/app/config/"
      read_only      = false
    },
    "/var/run/docker.sock" = {
      container_path = "/var/run/docker.sock"
      read_only      = true

    }

  }
}

#dummy
