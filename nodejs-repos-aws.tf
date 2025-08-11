# File with Node.js REST API repositories
module "products-api" {
  source      = "./modules/repo"
  name        = "products-api"
  description = "products-api"
  visibility  = "public"
  template_owner = "unir-tfm-devops"
  template_repository = "nodejs-template"

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
