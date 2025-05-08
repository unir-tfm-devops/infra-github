variable "name" {
  type        = string
  description = "The name of the repository"
}

variable "description" {
  type        = string
  description = "The description of the repository"
}

variable "visibility" {
  type        = string
  description = "The visibility of the repository (public, private, internal)"
  default     = "public"
}

variable "homepage_url" {
  type        = string
  description = "URL of a page describing the project"
  default     = null
}

variable "has_issues" {
  type        = bool
  description = "Enable issues for the repository"
  default     = true
}

variable "has_projects" {
  type        = bool
  description = "Enable projects for the repository"
  default     = false
}

variable "has_wiki" {
  type        = bool
  description = "Enable wiki for the repository"
  default     = true
}

variable "has_discussions" {
  type        = bool
  description = "Enable discussions for the repository"
  default     = false
}

variable "is_template" {
  type        = bool
  description = "Whether the repository is a template"
  default     = false
}

variable "allow_merge_commit" {
  type        = bool
  description = "Allow merge commits"
  default     = false
}

variable "allow_squash_merge" {
  type        = bool
  description = "Allow squash merging"
  default     = true
}

variable "allow_rebase_merge" {
  type        = bool
  description = "Allow rebase merging"
  default     = false
}

variable "allow_auto_merge" {
  type        = bool
  description = "Allow auto-merge"
  default     = false
}

variable "delete_branch_on_merge" {
  type        = bool
  description = "Automatically delete head branch after a pull request is merged"
  default     = true
}

variable "allow_update_branch" {
  type        = bool
  description = "Set to true to always suggest updating pull request branches."
  default     = true
}

variable "archived" {
  type        = bool
  description = "Archive the repository"
  default     = false
}

variable "topics" {
  type        = list(string)
  description = "A list of topics to set on the repository"
  default     = []
}

variable "auto_init" {
  type        = bool
  description = "Produce an initial commit with an empty README"
  default     = true
}

variable "gitignore_template" {
  type        = string
  description = "Gitignore template to apply (e.g. 'Node')"
  default     = null
}

variable "license_template" {
  type        = string
  description = "License template to use (e.g. 'mit', 'apache-2.0')"
  default     = null
}

variable "default_branch" {
  type        = string
  description = "The default branch for the repository"
  default     = "main"
}

variable "archive_on_destroy" {
  type        = bool
  description = "Set to true to archive the repository instead of deleting on destroy"
  default     = false
}

variable "template_owner" {
  type        = string
  description = "Owner of the template repository"
  default     = null
}

variable "template_repository" {
  type        = string
  description = "Name of the template repository"
  default     = null
}

variable "teams" {
  description = "Team permissions for the repository"
  type        = map(string)
  default = {
    "admins" = "admin"
  }
}

variable "repository_rulesets" {
  description = "List of repository rulesets"
  type        = map(any)
  default = {
    "default-ruleset" = {
      enforcement = "active"
      target      = "branch"
      conditions = {
        include = ["~DEFAULT_BRANCH"]
        exclude = []
      }
      bypass_actors = [
        {
          actor_type  = "OrganizationAdmin"
          actor_id    = null
          bypass_mode = "always"
        }
      ]
      rules = {
        deletion               = true
        non_fast_forward       = true
        required_linear_history = true
        pull_request = {
          dismiss_stale_reviews_on_push    = true
          require_code_owner_review        = false
          required_approving_review_count  = 1
        }
      }
    }
  }
}