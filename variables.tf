variable "github_token" {
  type        = string
  description = "The GitHub token to use"
  sensitive   = true
}

variable "github_organization" {
  type = string
  description = "The GitHub organization to use"
}
