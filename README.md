# GitHub Infrastructure Management

This repository contains Terraform configurations for managing GitHub organization resources, including repositories, teams, users, and automated workflows. It provides a complete infrastructure setup for managing GitHub resources as code with automated repository creation through issue templates.

## 🏗️ Infrastructure Overview

This Terraform project manages:

- **GitHub Repositories**: Public and private repositories with standardized configurations
- **Repository Templates**: Spring Boot and Node.js templates for consistent project setup
- **Teams & Permissions**: Organization teams with repository access controls
- **Automated Workflows**: GitHub Actions for automated repository creation
- **Repository Rulesets**: Branch protection and code review policies
- **Environments**: Test and production environments with approval workflows

## 📁 Project Structure

```
terraform-github/
├── main.tf                 # Main Terraform configuration
├── repos.tf                # General repositories configuration
├── spring-boot-repos.tf    # Spring Boot specific repositories
├── nodejs-repos.tf         # Node.js specific repositories
├── teams.tf                # Teams and permissions configuration
├── providers.tf            # GitHub provider configuration
├── variables.tf            # Input variables
├── extract-repo-info.py    # Python script for parsing issue data
└── modules/
    ├── repo/               # Repository module
    │   ├── main.tf         # Repository creation logic
    │   ├── variables.tf    # Module input variables
    │   ├── outputs.tf      # Module output values
    │   └── providers.tf    # Module provider configuration
    ├── team/               # Team module
    │   ├── main.tf         # Team creation logic
    │   ├── variables.tf    # Module input variables
    │   ├── outputs.tf      # Module output values
    │   └── providers.tf    # Module provider configuration
    └── user/               # User module
        ├── main.tf         # User management logic
        ├── variables.tf    # Module input variables
        └── providers.tf    # Module provider configuration
└── .github/
    ├── ISSUE_TEMPLATE/
    │   └── new-repo.yaml   # Issue template for new repository requests
    └── workflows/
        ├── create-repo-pr.yaml      # Main workflow for repository creation
        ├── create-spring-boot-repo.yaml  # Spring Boot specific workflow
        ├── create-nodejs-repo.yaml.yaml  # Node.js specific workflow
        ├── terraform-plan.yml       # Terraform plan workflow
        └── terraform-apply.yaml     # Terraform apply workflow
```

## 🚀 Features

### Repository Management
- **Standardized Configuration**: Consistent repository settings across the organization
- **Template Support**: Spring Boot and Node.js templates for new projects
- **Branch Protection**: Automated branch protection rules and code review policies
- **Environment Management**: Test and production environments with approval workflows
- **Label Management**: Standardized issue and PR labels across repositories

### Automated Workflows
- **Issue-Based Creation**: Create repositories through GitHub issue templates
- **Automated PR Generation**: Automatic pull request creation for new repositories
- **Terraform Integration**: Automated Terraform plan and apply workflows
- **Template Selection**: Support for different repository templates based on project type

### Security & Compliance
- **Repository Rulesets**: Enforced branch protection and code review policies
- **Team Permissions**: Granular access control through team assignments
- **Environment Approvals**: Required approvals for production deployments
- **Vulnerability Alerts**: Automated security scanning and alerts

## 🔧 Prerequisites

- **Terraform** >= 1.0
- **GitHub Account** with organization admin permissions
- **GitHub App** or Personal Access Token with appropriate scopes

## 📋 Requirements

### GitHub Requirements
- GitHub organization with appropriate permissions for:
  - Repository creation and management
  - Team and user management
  - GitHub App installation and configuration
  - Workflow execution

### Terraform Providers
- `integrations/github` - GitHub provider for managing GitHub resources

### Required Variables
- `github_token` - GitHub personal access token or app token
- `github_organization` - GitHub organization name

## 🚀 Quick Start

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Configure Variables
Create a `terraform.tfvars` file with your GitHub credentials:
```hcl
github_token        = "your-github-token"
github_organization = "your-organization-name"
```

### 3. Review the Plan
```bash
terraform plan
```

### 4. Apply the Configuration
```bash
terraform apply
```

## 📝 Creating New Repositories

### Method 1: Using Issue Template (Recommended)

1. **Create an Issue**: Go to the Issues tab and click "New Issue"
2. **Select Template**: Choose "New REST API Repository Request"
3. **Fill the Form**:
   - **Repository Name**: Enter the desired repository name
   - **Repository Description**: Provide a brief description
   - **Repository Visibility**: Choose public or private
   - **Repository Template**: Select from available templates or "No template"
   - **Cloud Provider**: Choose AWS or Azure (for future infrastructure)
4. **Submit the Issue**: The workflow will automatically:
   - Extract information from the issue
   - Create a new branch with repository configuration
   - Generate several pull requests with the changes
   - Apply Terraform configuration when approved

### Method 2: Manual Configuration

Add a new repository module to the appropriate file:

```hcl
module "my-new-repo" {
  source      = "./modules/repo"
  name        = "my-new-repo"
  description = "Description of my new repository"
  visibility  = "public"
  
  # Optional: Use a template
  template_owner      = "your-org"
  template_repository = "spring-boot-template"
  
  # Optional: Configure environments
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
  
  # Optional: Add custom labels
  labels = {
    "custom-label" = {
      color       = "FF0000"
      description = "Custom label description"
    }
  }
}
```

## 🔄 Module Usage

### Repository Module

The `modules/repo` module provides comprehensive repository management:

```hcl
module "example_repo" {
  source = "./modules/repo"
  
  name        = "example-repo"
  description = "Example repository"
  visibility  = "public"
  is_template = false
  
  # Template configuration
  template_owner      = "your-org"
  template_repository = "spring-boot-template"
  
  # Team permissions
  teams = {
    "developers" = "push"
    "admins"     = "admin"
  }
  
  # Repository rulesets
  repository_rulesets = {
    "main-branch-protection" = {
      enforcement = "active"
      target      = "branch"
      conditions = {
        include = ["~DEFAULT_BRANCH"]
      }
      rules = {
        required_linear_history = true
        pull_request = {
          required_approving_review_count = 2
          require_code_owner_review       = true
        }
      }
    }
  }
  
  # Environments
  environments = {
    test = {
      name = "test"
      reviewers = ["team-name"]
    }
    production = {
      name = "production"
      reviewers = ["admin-team"]
    }
  }
}
```

### Team Module

The `modules/team` module manages organization teams:

```hcl
module "developers" {
  source = "./modules/team"
  
  name        = "developers"
  description = "Development team"
  privacy     = "closed"
  
  members = [
    "user1",
    "user2"
  ]
}
```

## 🔐 Security Considerations

### Repository Security
- **Branch Protection**: Default branch protection rules are applied
- **Code Review**: Required code reviews for pull requests
- **Linear History**: Enforced linear commit history
- **Vulnerability Alerts**: Automated security scanning enabled

### Access Control
- **Team-Based Permissions**: Granular access control through teams
- **Environment Approvals**: Required approvals for production changes
- **Admin Bypass**: Organization admins can bypass certain restrictions

### Best Practices
1. **Use Issue Templates**: Always use the issue template for new repositories
2. **Review PRs**: Ensure all pull requests are reviewed before merging
3. **Environment Approvals**: Require approvals for production deployments
4. **Regular Updates**: Keep Terraform configurations and dependencies updated

## 🔄 Workflow Process

### Repository Creation Workflow

1. **Issue Creation**: User creates issue using the template
2. **Information Extraction**: Python script parses issue data
3. **File Selection**: Workflow determines which Terraform file to modify
4. **Configuration Generation**: Repository configuration is added to appropriate file
5. **Pull Request Creation**: Automated PR with the changes
6. **Review Process**: Manual review and approval
7. **Terraform Apply**: Automated application of changes
8. **Repository Creation**: New repository is created in GitHub

### Available Templates

- **Spring Boot Template**: For Java/Spring Boot applications
- **Node.js Template**: For Node.js applications
- **No Template**: Empty repository with basic configuration

## 📊 Outputs

| Output | Description |
|--------|-------------|
| `repository_urls` | URLs of all created repositories |
| `team_ids` | IDs of created teams |
| `user_ids` | IDs of managed users |

## 🧹 Cleanup

To destroy all resources:
```bash
terraform destroy
```

⚠️ **Warning**: This will permanently delete all managed GitHub resources.

## 🔧 Customization

### Repository Configuration
Modify `modules/repo/variables.tf` to adjust:
- Default repository settings
- Branch protection rules
- Label configurations
- Environment settings

### Workflow Customization
Modify `.github/workflows/` files to adjust:
- Issue parsing logic
- PR creation process
- Terraform execution steps

### Template Management
Update template configurations in:
- `spring-boot-repos.tf` for Spring Boot templates
- `nodejs-repos.tf` for Node.js templates
- `repos.tf` for general repositories

## 📝 Notes

- **Issue Template**: The issue template is the primary method for creating new repositories
- **Automated Workflows**: All repository creation is automated through GitHub Actions
- **Terraform Cloud**: This project uses Terraform Cloud for state management
- **Provider Aliases**: Separate provider configurations for different resource types

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with `terraform plan`
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
