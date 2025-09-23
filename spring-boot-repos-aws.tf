# File with Spring Boot REST API repositories

module "bank-service" {
  source      = "./modules/repo"
  name        = "bank-service"
  description = "REST API that manages bank accounts"
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
