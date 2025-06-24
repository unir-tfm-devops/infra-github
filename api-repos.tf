# File with REST API repositories


module "products-search-api" {
  source      = "./modules/repo"
  name        = "products-search-api"
  description = "products-search-api"
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
