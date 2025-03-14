output "repo_url" {
  description = "The URL of the created GitHub repository"
  value       = github_repository.this.html_url
}

output "repo_clone_url" {
  description = "The Git clone URL of the repository"
  value       = github_repository.this.clone_url
}
