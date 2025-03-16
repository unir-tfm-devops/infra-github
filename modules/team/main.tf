resource "github_team" "this" {
  name        = var.name
  description = var.description
  privacy     = var.privacy
  parent_team_id = var.parent_team_id
}