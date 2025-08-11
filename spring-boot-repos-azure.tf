# File with Spring Boot REST API repositories

module "products-service" {
  source      = "./modules/repo"
  name        = "products-service"
  description = "products-servoce"
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
