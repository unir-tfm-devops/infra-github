# File with repositories for the organization

module "terraform-aks" {
  source      = "./modules/repo"
  name        = "terraform-aks"
  description = "Repository for EKS configuration"
  visibility  = "public"
}
