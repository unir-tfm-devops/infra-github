resource "github_repository" "this" {
  name        = var.name
  description = var.description
  visibility  = var.visibility

  homepage_url = var.homepage_url
  has_issues  = var.has_issues
  has_wiki    = var.has_wiki
  has_projects = var.has_projects
  has_discussions = var.has_discussions
  is_template = var.is_template
  allow_merge_commit = var.allow_merge_commit
  allow_squash_merge = var.allow_squash_merge
  allow_rebase_merge = var.allow_rebase_merge
  allow_auto_merge = var.allow_auto_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  allow_update_branch = var.allow_update_branch
  archived = var.archived
  topics = var.topics
  auto_init = var.auto_init
  gitignore_template = var.gitignore_template
  license_template = var.license_template
  archive_on_destroy = var.archive_on_destroy

  dynamic "template" {
    for_each = var.template_owner != null && var.template_repository != null ? [1] : []
    content {
      owner      = var.template_owner
      repository = var.template_repository
    }
  }
}

resource "github_team_repository" "some_team_repo" {
  for_each   = var.teams
  team_id    = each.key
  repository = github_repository.this.name
  permission = each.value
}

resource "github_repository_ruleset" "this" {
  for_each    = var.archived ? {} : var.repository_rulesets
  name        = each.key
  repository  = github_repository.this.name
  target      = lookup(each.value, "target", "branch")
  enforcement = lookup(each.value, "enforcement", "active")

  conditions {
    ref_name {
      include = try(each.value.conditions.include, ["~DEFAULT_BRANCH"])
      exclude = try(each.value.conditions.exclude, [])
    }
  }

  dynamic "bypass_actors" {
    for_each = lookup(each.value, "bypass_actors", [])
    content {
      actor_id    = try(bypass_actors.value.actor_id, null)
      actor_type  = try(bypass_actors.value.actor_type, null)
      bypass_mode = try(bypass_actors.value.bypass_mode, null)
    }
  }

  rules {
    creation                = try(each.value.rules.creation, null)
    update                  = try(each.value.rules.update, null)
    deletion                = try(each.value.rules.deletion, null)
    non_fast_forward        = try(each.value.rules.non_fast_forward, null)
    required_linear_history = try(each.value.rules.required_linear_history, null)
    required_signatures     = try(each.value.rules.required_signatures, null)

    dynamic "pull_request" {
      for_each = try(each.value.rules.pull_request, {}) != {} ? [1] : []
      content {
        dismiss_stale_reviews_on_push     = try(pull_request.value.dismiss_stale_reviews_on_push, null)
        require_code_owner_review         = try(pull_request.value.require_code_owner_review, null)
        required_approving_review_count   = try(pull_request.value.required_approving_review_count, null)
        require_last_push_approval        = try(pull_request.value.require_last_push_approval, null)
        required_review_thread_resolution = try(pull_request.value.required_review_thread_resolution, null)
      }
    }

    dynamic "required_status_checks" {
      for_each = try(each.value.rules.required_status_checks, {}) != {} ? [1] : []
      content {
        strict_required_status_checks_policy = try(each.value.rules.required_status_checks.strict_required_status_checks_policy, null)

        dynamic "required_check" {
          for_each = try(each.value.rules.required_status_checks.required_checks, [])
          content {
            context         = required_check.value.context
            integration_id  = try(required_check.value.integration_id, null)
          }
        }
      }
    }
  }
}