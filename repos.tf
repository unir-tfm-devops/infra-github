# File with repositories for the organization
module "products-search" {
  source      = "./modules/repo"
  name        = "products-search"
  description = "Products Search repository"
  visibility  = "public"
}