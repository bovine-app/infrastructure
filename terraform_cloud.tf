resource "tfe_organization" "bovine" {
  name  = "bovine-app"
  email = "jesse@jbhannah.net"
}

resource "tfe_workspace" "infra" {
  name         = "infrastructure"
  organization = tfe_organization.bovine.id

  auto_apply            = true
  execution_mode        = "remote"
  file_triggers_enabled = false
  queue_all_runs        = false
  speculative_enabled   = false

  vcs_repo {
    identifier     = github_repository.infra.full_name
    oauth_token_id = ""
  }
}

resource "tfe_variable" "github_token" {
  workspace_id = tfe_workspace.infra.id
  key          = "github_token"
  value        = var.github_token
  category     = "terraform"
  sensitive    = true
}

resource "tfe_variable" "tfe_token" {
  workspace_id = tfe_workspace.infra.id
  key          = "tfe_token"
  value        = var.tfe_token
  category     = "terraform"
  sensitive    = true
}

resource "tfe_variable" "api_rails_master_key" {
  workspace_id = tfe_workspace.infra.id
  key          = "api_rails_master_key"
  value        = var.api_rails_master_key
  category     = "terraform"
  sensitive    = true
}
