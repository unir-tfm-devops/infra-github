# File with REST API repositories

module "products-search-api-3" {
  source      = "./modules/repo"
  name        = "products-search-api-3"
  description = "products-search-api-3"
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


