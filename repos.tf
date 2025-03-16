module "products-search" {
  source = "./modules/repo"

  name        = "products-search"
  description = "This is my repo created automatically by Terraform"
  visibility  = "private"

}

module "spring-boot-template" {
  source      = "./modules/repo"
  name        = "spring-boot-template"
  description = "Repository for the spring boot template"
  visibility  = "public"
}
