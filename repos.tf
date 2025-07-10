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

module "reusable-github-actions" {
  source      = "./modules/repo"
  name        = "reusable-github-actions"
  description = "Stores reusable github actions and workflows for this organization"
  visibility  = "public"
}

module "terraform-ecr" {
  source      = "./modules/repo"
  name        = "terraform-ecr"
  description = "Repository for ECR configuration"
  visibility  = "public"
}

module "terraform-chartmuseum" {
  source      = "./modules/repo"
  name        = "terraform-chartmuseum"
  description = "Repository for Chartmuseum deployment and configuration"
  visibility  = "public"
}

module "eks-workloads" {
  source      = "./modules/repo"
  name        = "eks-workloads"
  description = "Repository for EKS workloads. Stores services configurations and ArgoCD applications that runs on EKS"
  visibility  = "public"
  
  labels = {
    "breaking-change" = {
      color       = "D93F0B"
      description = "Change affects backward compatibility"
    },
    "bug" = {
      color       = "d73a4a"
      description = "Something isn't working"
    },
    "documentation" = {
      color       = "0075ca"
      description = "Improvements or additions to documentation"
    },
    "enhancement" = {
      color       = "a2eeef"
      description = "Improvement to an existing feature"
    },
    "feature" = {
      color       = "0E8A16"
      description = "New feature"
    },
    "deprecation" = {
      color       = "FBCA04"
      description = "Deprecation of existing functionality"
    },
    "dependency" = {
      color       = "5319E7"
      description = "Update to dependencies"
    },
    "new-app" = {
      color       = "87CEEB"
      description = "New ArgoCD application"
    }
  }
}

module "infra-rds" {
  source      = "./modules/repo"
  name        = "infra-rds"
  description = "Repository for RDS instaces configuration"
  visibility  = "public"
}

module "sonarqube-projects" {
  source      = "./modules/repo"
  name        = "sonarqube-projects"
  description = "Repository for Sonarqube projects configuration"
  visibility  = "public"
} 

module "snyk-projects" {
  source      = "./modules/repo"
  name        = "snyk-projects"
  description = "Repository for Snyk projects configuration"
  visibility  = "public"
}

module "infra-aks" {
  source      = "./modules/repo"
  name        = "infra-aks"
  description = "Repository for AKS cluster configuration"
  visibility  = "public"
}

module "infra-acr" {
  source      = "./modules/repo"
  name        = "infra-acr"
  description = "Repository for ACR repositories configuration"
  visibility  = "public"
}

module "infra-azure-dbs" {
  source      = "./modules/repo"
  name        = "infra-azure-dbs"
  description = "Repository for Azure Postgresql DBs configuration"
  visibility  = "public"
}

module "aks-workloads" {
  source      = "./modules/repo"
  name        = "aks-workloads"
  description = "Repository for AKS workloads. Stores services configurations and ArgoCD applications that runs on AKS"
  visibility  = "public"
  
  labels = {
    "breaking-change" = {
      color       = "D93F0B"
      description = "Change affects backward compatibility"
    },
    "bug" = {
      color       = "d73a4a"
      description = "Something isn't working"
    },
    "documentation" = {
      color       = "0075ca"
      description = "Improvements or additions to documentation"
    },
    "enhancement" = {
      color       = "a2eeef"
      description = "Improvement to an existing feature"
    },
    "feature" = {
      color       = "0E8A16"
      description = "New feature"
    },
    "deprecation" = {
      color       = "FBCA04"
      description = "Deprecation of existing functionality"
    },
    "dependency" = {
      color       = "5319E7"
      description = "Update to dependencies"
    },
    "new-app" = {
      color       = "87CEEB"
      description = "New ArgoCD application"
    }
  }
}
