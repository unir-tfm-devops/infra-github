variable "name" {
  type = string
  description = "The name of the GitHub team"
}

variable "description" {
  type = string
  description = "The description of the GitHub team"
}

variable "privacy" {
  type = string
  description = "The privacy of the GitHub team"
  default = "closed"
}

variable "parent_team_id" {
  type = string
  description = "The parent team ID of the GitHub team"
  default = null
}