module "github-repo" {
  source = "./modules/repo"

  name        = "created-terraform-repo"
  description = "This is my repo created automatically by Terraform"
  visibility  = "private"

}



module "github-repo-products-search" {
  source      = "./modules/repo"
  name        = "products-search"
  description = "Description for the repository"
  visibility  = "public"
}
