module "github_repo" {
  source = "./modules/repo"

  name        = "created-terraform-repo"
  description = "This is my repo created automatically by Terraform"
  visibility  = "private"

}
