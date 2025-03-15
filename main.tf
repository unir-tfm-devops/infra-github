module "github-repo" {
  source = "./modules/repo"

  name        = "created-terraform-repo"
  description = "This is my repo created automatically by Terraform"
  visibility  = "private"

}



module "github-repo-products-search" {
  source      = "./modules/repo"
  name        = "products-search"
  description = "This repo is used for storing the code for a service used for retrieving products for customers."
  visibility  = "Public"
}
