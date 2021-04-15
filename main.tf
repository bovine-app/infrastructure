terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.8.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.24.0"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "bovine-app"

    workspaces {
      name = "infrastructure"
    }
  }
}

provider "github" {
  owner = "bovine-app"
  token = var.github_token
}

provider "tfe" {
  token = var.tfe_token
}
