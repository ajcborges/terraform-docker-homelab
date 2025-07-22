module "container" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ef=container/2.0.0"

  image          = "ghcr.io/gethomepage/homepage:v1.3.2"
  container_name = "homepage"
  hostname       = "homepage"
  restart_policy = "unless-stopped"
  environment = {
    PUID = "1000"
    GUID = "1000"
    TZ   = "Australia/Melbourne"
    HOMEPAGE_ALLOWED_HOSTS = "nightking:3000"
  }
  ports = [{
    external = "3000"
    internal = "3000"
    protocol = "tcp"
  }]


  host_paths = {
    "/mnt/usb2tb/containers/homepage/" = {
      container_path = "/app/config/"
      read_only      = false
    },
    "/var/run/docker.sock" = {
      container_path = "/var/run/docker.sock"
      read_only      = true

    }

  }
}

