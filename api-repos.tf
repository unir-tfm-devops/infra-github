# File with REST API repositories

module "products-search-api-4" {
  source      = "./modules/repo"
  name        = "products-search-api-4"
  description = "products-search-api-4"
  visibility  = "public"
  template_owner = "unir-tfm-devops"
  template_repository = "spring-boot-template"

  environments = {
    test = {
      name = "test"
      reviewers = []
    }
    production = {
      name = "production"
      reviewers = [module.admins.id]
    }
  }
}


