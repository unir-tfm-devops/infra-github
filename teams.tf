module "admins" {
  source      = "./modules/team"
  name        = "admins"
  description = "Admin teams"
}

module "alvarorg14" {
  source = "./modules/user"
  username = "alvarorg14"
  github_membership = "admin"
  teams = { "admins" = "maintainer" }
}