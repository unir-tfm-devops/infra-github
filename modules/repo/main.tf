resource "github_repository" "this" {
  name        = var.name
  description = var.description
  visibility  = var.visibility

  # Optional settings
  auto_init    = true
  has_issues   = true
  has_projects = false
  has_wiki     = true
}
