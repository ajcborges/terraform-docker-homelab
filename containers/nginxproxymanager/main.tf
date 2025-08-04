module "container" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ref=container/2.0.0"

  image          = "jc21/nginx-proxy-manager:2.12.3"
  container_name = "nginxproxymanager"
  hostname       = "nginxproxymanager"
  restart_policy = "unless-stopped"
  privileged     = false
  environment = {
    PUID                   = "1000"
    PGID                   = "1000"
    TZ                     = "Australia/Melbourne"
    INITIAL_ADMIN_EMAIL    = var.nginxproxymanager_email
    INITIAL_ADMIN_PASSWORD = var.nginxproxymanager_password

  }

  ports = [{
    external = "80"
    internal = "80"
    protocol = "tcp"
    },
    {
      external = "443"
      internal = "443"
      protocol = "tcp"
    },
    {
      external = "81"
      internal = "81"
      protocol = "tcp"
    }
  ]



  host_paths = {
    "/srv/share/containers/nginxproxymanager/data" = {
      container_path = "/data"
      read_only      = false
    },
    "/srv/share/containers/nginxproxymanager/etc/letsencrypt" = {
      container_path = "/etc/letsencrypt/"
      read_only      = false
    },
  }
}
