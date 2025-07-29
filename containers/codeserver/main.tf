module "container" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ref=container/2.0.0"

  image          = "linuxserver/code-server:4.101.2"
  container_name = "codeserver"
  hostname       = "codeserver"
  restart_policy = "always"
  privileged     = false
  environment = {
    PUID              = "1000"
    PGID              = "1000"
    PASSWORD          = "${var.password}"
    SUDO_PASSWORD     = "${var.sudo_password}"
    DEFAULT_WORKSPACE = "/config/workspaces"
    TZ                = "Australia/Melbourne"
  }

  ports = [{
    external = "8443"
    internal = "8443"
    protocol = "tcp"
  }]

  host_paths = {
    "/srv/share/containers/codeserver/config/" = {
      container_path = "/config/"
      read_only      = false
    },
    "/srv/share/containers/codeserver/projects/" = {
      container_path = "/projects/"
      read_only      = false
    },
  }
}