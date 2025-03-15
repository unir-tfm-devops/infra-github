module "github-repo" {
  source = "./modules/repo"

  name        = "created-terraform-repo"
  description = "This is my repo created automatically by Terraform"
  visibility  = "private"

}

module "products-search-2" {
  source      = "./modules/repo"
  name        = "products-search-2"
  description = "Description"
  visibility  = "public"
}

module "personal-repo-alvaro" {
  source      = "./modules/repo"
  name        = "personal-repo-alvaro"
  description = "Description for the personal repo"
  visibility  = "private"
}
