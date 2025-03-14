module "github-repo-2" {
  source = "./modules/repo"

  name        = "created-terraform-repo-2"
  description = "This is my repo created automatically by Terraform"
  visibility  = "private"

}

module "github-repo" {
  source = "./modules/repo"

  name        = "created-terraform-repo"
  description = "This is my repo created automatically by Terraform"
  visibility  = "private"

}


