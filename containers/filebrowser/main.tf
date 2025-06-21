module "container" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ref=container/2.0.0"

  image          = "filebrowser/filebrowser:latest"
  container_name = "FileBrowser"
  hostname       = "filebrowser"
  restart_policy = "unless-stopped"
  # dns            = ["8.8.8.8"]
  environment = {
    PUID                                         = "1000"
    GUID                                         = "1000"
    TZ                                           = "Australia/Melbourne"
    FILEBROWSER_BASEURL                          = "/"
    FILEBROWSER_ROOT                             = "/mnt/usb2tb/containers/filebrowser/"
    FILEBROWSER_AUTH_METHOD                      = "password"
    FILEBROWSER_AUTH_USERNAME                    = "admin"
    FILEBROWSER_AUTH_PASSWORD                    = "admin"
    FILEBROWSER_AUTH_PASSWORD_CONFIRM            = "admin"
    FILEBROWSER_AUTH_DEFAULT_PERMISSIONS         = "rwxr-xr-x"
    FILEBROWSER_AUTH_DEFAULT_PERMISSIONS_DIR     = "rwxr-xr-x"
    FILEBROWSER_AUTH_DEFAULT_PERMISSIONS_FILE    = "rw-r--r--"
    FILEBROWSER_AUTH_DEFAULT_PERMISSIONS_SYMLINK = "rwxr-xr-x"
    FILEBROWSER_AUTH_DEFAULT_PERMISSIONS_SOCKET  = "rwxr-xr-x"
    
  }
  ports = [{
    external = "8081"
    internal = "80"
    protocol = "tcp"
  }]


  host_paths = {
    "/mnt/usb2tb/containers/filebrowser/database/filebrowser.db" = {
      container_path = "/database/filebrowser.db"
      read_only      = false
    },
    "/mnt/usb2tb/containers/filebrowser/config/settings.json" = {
      container_path = "/config/settings.json"
      read_only      = false
    },
    "/mnt/usb2tb/" = {
      container_path = "/srv"
      read_only      = true

    }

  }
}
