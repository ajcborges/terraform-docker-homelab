output "image_name" {
  value = module.container.image_name
}

output "container_name" {
  value = module.container.container_name
}

output "hostname" {
  value = module.container.hostname
}

output "working_dir" {
  value = module.container.working_dir
}

output "restart" {
  value = module.container.restart
}

output "privileged" {
  value = module.container.privileged
}

output "network_mode" {
  value = module.container.network_mode
}

output "dns" {
  value = module.container.dns
}

output "entrypoint" {
  value = module.container.entrypoint
}

output "command" {
  value = module.container.command
}

output "ports" {
  value = module.container.ports
}

output "volumes" {
  value = module.container.volumes
}

output "docker_volumes" {
  value = module.container.docker_volumes
}

output "devices" {
  value = module.container.devices
}

output "capabilities" {
  value = module.container.capabilities
}

output "networks_advanced" {
  value = module.container.networks_advanced
}

output "healthcheck" {
  value = module.container.healthcheck
}

output "environment" {
  value = module.container.environment
}

output "docker_networks" {
  value = module.container.docker_networks
}

output "docker_host" {
  value = var.docker_host
}