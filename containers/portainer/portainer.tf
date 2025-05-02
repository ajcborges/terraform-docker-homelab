module "container" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ref=ba73b21"

  image          = "portainer/portainer-ce"
  container_name = "portainer"
  hostname       = "portainer"
  restart_policy = "always"
  ports = [{
    external = "9443"
    internal = "9443"
    protocol = "tcp"
  }]

  # named_volumes = {
  #   "portainer_data" = {
  #     container_path = "/opt/portainer/data"
  #     read_only      = false
  #     create         = true
  #   }
  # }

  host_paths = {
    "/mnt/citadel/portainer/" = {
      container_path = "/opt/portainer/"
      read_only      = false
    },
    "/var/run/docker.sock" = {
      container_path = "/var/run/docker.sock"
      read_only      = true

    }

  }
}

# # 🔥 Your cleanup block (right after the module)
# resource "null_resource" "cleanup" {
#   triggers = {
#     always_run = "${timestamp()}"
#   }

#   provisioner "local-exec" {
#     when    = destroy
#     command = "rm -rf /mnt/citadel/portainer"
#   }
# }
