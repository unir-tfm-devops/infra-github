# File with repositories for the organization
module "products-search" {
  source      = "./modules/repo"
  name        = "products-search"
  description = "Products Search repository"
  visibility  = "public"
}

module "products-search-1" {
  source      = "./modules/repo"
  name        = "products-search-new"
  description = "Products Search repository new"
  visibility  = "public"
}