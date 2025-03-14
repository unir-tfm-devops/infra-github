output "repo_url" {
  description = "The URL of the created GitHub repository"
  value       = github_repository.this.html_url
}
