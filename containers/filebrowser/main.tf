module "container" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ref=ba73b21"

  image          = "filebrowser/filebrowser:latest"
  container_name = "filebrowser2"
  hostname       = "filebrowser"
  restart_policy = "unless-stopped"
  environment = {
    PUID = "1000"
    GUID = "1000"
    TZ   = "Australia/Melbourne"
    FILEBROWSER_BASEURL = "/"
    FILEBROWSER_DATABASE = "/data/filebrowser.db"
    FILEBROWSER_ROOT = "/mnt/usb2tb/containers/filebrowser/"
    FILEBROWSER_AUTH_METHOD = "password"
    FILEBROWSER_AUTH_USERNAME = "admin"
    FILEBROWSER_AUTH_PASSWORD = "admin"
    FILEBROWSER_AUTH_PASSWORD_CONFIRM = "admin"
    FILEBROWSER_AUTH_DEFAULT_PERMISSIONS = "rwxr-xr-x"
    FILEBROWSER_AUTH_DEFAULT_PERMISSIONS_DIR = "rwxr-xr-x"
    FILEBROWSER_AUTH_DEFAULT_PERMISSIONS_FILE = "rw-r--r--"
    FILEBROWSER_AUTH_DEFAULT_PERMISSIONS_SYMLINK = "rwxr-xr-x"
    FILEBROWSER_AUTH_DEFAULT_PERMISSIONS_SOCKET = "rwxr-xr-x"
  }
  ports = [{
    external = "8001"
    internal = "80"
    protocol = "tcp"
  }]


  host_paths = {
    "/mnt/usb2tb/containers/filebrowser/data" = {
      container_path = "/data/"
      read_only      = false
    },
    "/mnt/usb2tb/" = {
      container_path = "/srv"
      read_only      = true

    }

  }
}
# dummy commit