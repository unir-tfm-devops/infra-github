module "github-repo" {
  source = "./modules/repo"

  name        = "created-terraform-repo"
  description = "This is my repo created automatically by Terraform"
  visibility  = "private"

}



module "github-repo-products-search" {
  source      = "./modules/repo"
  name        = "products-search"
  description = "Description for this repository that will store Java and C# code."
  visibility  = "public"
}

module "github-repo-products-search-2" {
  source      = "./modules/repo"
  name        = "products-search-2"
  description = "Description for the products search"
  visibility  = "private"
}
