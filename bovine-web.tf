resource "github_repository" "web" {
  name        = "bovine-web"
  description = "Web app for the Bovine podcatcher"

  gitignore_template = "Node"
  license_template   = "mit"

  auto_init              = true
  delete_branch_on_merge = true
}

resource "github_branch_protection" "web_default_branch" {
  repository_id = github_repository.web.node_id
  pattern       = github_repository.web.default_branch

  allows_deletions    = false
  allows_force_pushes = false
  enforce_admins      = true

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }
}
