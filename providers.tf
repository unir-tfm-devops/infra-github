terraform {
  cloud {
    organization = "alvarorg14-org"

    workspaces {
      name = "unir-tfm-terraform-github"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = var.github_organization
}
