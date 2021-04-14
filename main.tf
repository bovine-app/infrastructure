terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.8.0"
    }
  }
}

provider "github" {
  owner = "bovine-app"
  token = var.github_token
}
