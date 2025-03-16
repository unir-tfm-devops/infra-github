variable "username" {
  type = string
  description = "The username of the GitHub user"
}

variable "github_membership" {
  type = string
  default = "member"
  description = "The membership of the GitHub user, member or admin"
}

variable "teams" {
    type = map(any)
    description = "The teams to add the GitHub user to"
}
