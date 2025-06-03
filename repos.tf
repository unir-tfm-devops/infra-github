# File with repositories for the organization

module "terraform-eks" {
  source      = "./modules/repo"
  name        = "terraform-eks"
  description = "Repository for EKS configuration"
  visibility  = "public"
}

module "spring-boot-template" {
  source      = "./modules/repo"
  name        = "spring-boot-template"
  description = "Template for building Rest APIs using Java and Spring Boot"
  visibility  = "public"
  is_template = true
}

module "reusable-github-actions" {
  source      = "./modules/repo"
  name        = "reusable-github-actions"
  description = "Stores reusable github actions and workflows for this organization"
  visibility  = "public"
}
