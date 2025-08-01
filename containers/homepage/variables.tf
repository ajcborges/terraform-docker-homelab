variable "path" {
  description = "env"
  type        = string
  default     = null
}
variable "image" {
  description = "Specify the image to start the container from. Can either be a repository/tag or a partial image ID"
  type        = string
  default     = null
}

variable "docker_host" {
  description = "Docker Host Server"
  type        = string
  default     = "unix:///var/run/docker.sock"
}
variable "init" {
  description = "If init process should be used as the PID 1 in the container"
  type        = bool
  default     = false
}
variable "existing_image" {
  description = "Specify an existing image from another module"
  type        = string
  default     = null
}
variable "container_name" {
  description = "Custom container name"
  type        = string
  default     = null
}
variable "hostname" {
  description = "Set docker hostname"
  type        = string
  default     = null
}
variable "working_dir" {
  description = "Working directory inside the container"
  type        = string
  default     = null
}
variable "restart_policy" {
  description = "Restart policy. Default: no"
  type        = string
  default     = "no"
}
variable "privileged" {
  description = "Give extended privileges to this container"
  type        = bool
  default     = false
}
variable "network_mode" {
  description = "Specify a custom network mode"
  type        = string
  default     = null
}
variable "dns" {
  description = "Set custom dns servers for the container"
  type        = list(string)
  default     = null
}
variable "entrypoint" {
  description = "Override the default entrypoint"
  type        = list(string)
  default     = null
}
variable "command" {
  description = "Override the default command"
  type        = list(string)
  default     = null
}
variable "ports" {
  description = "Expose ports"
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = null
}
variable "named_volumes" {
  description = "Mount named volumes"
  type = map(object({
    container_path = string
    read_only      = bool
    create         = bool
  }))
  default = {}
}
variable "host_paths" {
  description = "Mount host paths"
  type = map(object({
    container_path = string
    read_only      = bool
  }))
  default = {}
}
variable "volumes_from_containers" {
  description = "Mount volumes from another container"
  type        = list(any)
  default     = null
}
variable "devices" {
  description = "Device mappings"
  type = map(object({
    container_path = string
    permissions    = string
  }))
  default = {}
}
variable "capabilities" {
  description = "Add or drop container capabilities"
  type = object({
    add  = list(string)
    drop = list(string)
  })
  default = null
}
variable "networks_advanced" {
  description = <<EOD
Advanced network options for the container
```hcl
networks_advanced = [
  {
    name         = "proxy-tier"
    ipv4_address = "10.0.0.14"
  },
  {
    name         = "media-tier"
    ipv4_address = "172.0.0.14"
  }
]
```
EOD
  type        = any
  default     = null
}
variable "healthcheck" {
  description = "Test to check if container is healthy"
  type = object({
    interval     = string
    retries      = number
    start_period = string
    test         = list(string)
    timeout      = string
  })
  default = null
}
variable "environment" {
  description = "Add environment variables"
  type        = map(string)
  default     = null
}
variable "docker_networks" {
  description = <<EOD
List of custom networks to create
```hcl
docker_networks = [
  {
    name = "proxy-tier"
    ipam_config = {
      aux_address = {}
      gateway     = "10.0.0.1"
      subnet      = "10.0.0.0/24"
    }
  }
]
```
EOD
  type        = any
  default     = []
}

variable "homepage_allowed_hosts" {
  description = "Specify a allowed hosts for the Homepage container"
  type        = string
  default     = "192.168.30.20:3000"
  validation {
    condition     = can(regex("^[a-zA-Z0-9.-]+:[0-9]+$", var.homepage_allowed_hosts))
    error_message = "Homepage allowed hosts must be in the format 'hostname:port'."
  }
  sensitive = true
}
