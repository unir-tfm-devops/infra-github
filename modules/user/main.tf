resource "github_membership" "this" {
  username = var.username
  role     = var.github_membership
}

resource "github_team_membership" "some_team_membership" {
  for_each = var.teams
  team_id  = each.key
  username = github_membership.this.username
  role     = each.value
}