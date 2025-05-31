# Terraform IaC

## What is Terraform?

Open-source IaC tool by HashiCorp. Uses HCL to define and provision infrastructure across AWS, Azure, GCP. Declarative, idempotent infrastructure management.

---

## Why Terraform?

- Infrastructure automation & versioning
- Multi-cloud orchestration
- Modular, reusable configs
- State management & drift detection

---

## Core Files

### `main.tf`
Resource definitions and configurations.

### `variables.tf`
Input variable declarations.

### `terraform.tfvars`
Variable value assignments. **Exclude from VCS** for secrets.

### `outputs.tf`
Export values post-apply (IPs, ARNs, etc.).

### `providers.tf`
Provider configuration and versioning.

```hcl
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    region = var.aws_region
}
```