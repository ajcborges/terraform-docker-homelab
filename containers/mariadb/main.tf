module "container" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ref=ba73b21"

  image          = "jc21/mariadb-aria:latest"
  container_name = "mariadb"
  hostname       = "mariadb"
  restart_policy = "unless-stopped"
  environment = {
    PUID                 = "1000"
    GUID                 = "1000"
    TZ                   = "Australia/Melbourne"
    MYSQL_ROOT_PASSWORD  = "npm"
    MYSQL_DATABASE       = "npm"
    MYSQL_USER           = "npm"
    MYSQL_PASSWORD       = "npm"
    MARIADB_AUTO_UPGRADE = "1"
  }

  host_paths = {
    "/mnt/containers/mariadb/mysql/" = {
      container_path = "/var/lib/mysql/"
      read_only      = false
    }

  }
}

