module "admins" {
  source      = "./modules/teams"
  name        = "admins"
  description = "Admin teams"
}

module "alvarorg14" {
  source = "./modules/users"
  username = "alvarorg14"
  github_membership = "admin"
  teams = { "admins" = "admin" }
}