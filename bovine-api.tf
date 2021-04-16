resource "github_repository" "api" {
  name        = "bovine-api"
  description = "API server for the Bovine podcatcher"

  gitignore_template = "Rails"
  license_template   = "mit"

  auto_init              = true
  delete_branch_on_merge = true
  has_issues             = true
  has_wiki               = true
}

resource "github_branch_protection" "api_default_branch" {
  repository_id = github_repository.api.node_id
  pattern       = github_repository.api.default_branch

  allows_deletions    = false
  allows_force_pushes = false
  enforce_admins      = false

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }
}
