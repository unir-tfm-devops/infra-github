# File with repositories for the organization

module "terraform-aks" {
  source      = "./modules/repo"
  name        = "terraform-aks"
  description = "Repository for AKS configuration"
  visibility  = "public"
}
