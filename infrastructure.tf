resource "github_repository" "infra" {
  name        = "infrastructure"
  description = "Organization infrastructure for the Bovine podcatcher"

  gitignore_template = "Terraform"
  license_template   = "mit"

  auto_init              = false
  delete_branch_on_merge = true
  has_issues             = true
  has_wiki               = true
}

resource "github_branch_protection" "infra_default_branch" {
  repository_id = github_repository.infra.node_id
  pattern       = github_repository.infra.default_branch

  allows_deletions    = false
  allows_force_pushes = false
  enforce_admins      = false
}
