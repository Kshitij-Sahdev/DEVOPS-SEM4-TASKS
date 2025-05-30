# Terraform: VPC, Subnet, EC2 with Modules

Modular Terraform setup for AWS VPC, subnet, and EC2 instance.

---

## Structure

```bash
Task2/
├── modules/
│   ├── vpc/
│   ├── subnet/
│   └── ec2/
├── main.tf
├── variables.tf
├── terraform.tfvars
└── outputs.tf
```

## Modules

### VPC
- Creates VPC with CIDR block
- Outputs VPC ID

### Subnet  
- Creates subnet in VPC
- Outputs subnet ID

### EC2
- Launches instance in subnet
- Outputs instance ID

## Root Module
- Calls all child modules
- Variables in `terraform.tfvars`
- Outputs all resource IDs

## Commands

```bash
terraform init
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve
```
