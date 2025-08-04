resource "github_actions_secret" "homelab_container_secrets" {
  repository      = var.github_repository
  secret_name     = var.secret_name
  plaintext_value = var.secret_value
}
