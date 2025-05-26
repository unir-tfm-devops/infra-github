# File with repositories for the organization

module "terraform-eks" {
  source      = "./modules/repo"
  name        = "terraform-eks"
  description = "Repository for EKS configuration"
  visibility  = "public"
}

module "products-search" {
  source      = "./modules/repo"
  name        = "products-search"
  description = "Example description"
  visibility  = "public"
}

module "spring-boot-template" {
  source      = "./modules/repo"
  name        = "spring-boot-template"
  description = "Template for building Rest APIs using Java and Spring Boot"
  visibility  = "public"
}
