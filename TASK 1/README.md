# Terraform AWS EC2 Quick Setup

Set up an Ubuntu EC2 on AWS with Terraform. Uses variables

## Config
- Instance: t3.micro
- OS: Ubuntu (AMI ID)
- Subnet: your Subnet ID
- Public IP: off
- Root EBS: 12 GB

## 1. Install

### AWS CLI (Linux)
```bash
sudo apt update
sudo apt install awscli -y
aws --version
```

### Terraform (Windows)
```bash
choco install terraform
```

---

## 2. AWS CLI Setup
```bash
aws configure
```
- Access Key
- Secret Key
- Region (e.g. us-east-1)
- Output: json

Get keys from AWS Console > My Security Credentials > Create New Access Key.

---

## 3. Files

```
|-------------------|-------------------------------|
| provider.tf       | AWS provider config            |
| main.tf           | EC2 resource config            |
| variables.tf      | Input variables                |
| terraform.tfvars  | Variable values                |
```

---

## 4. Terraform Commands

```bash
terraform init      # Init project
terraform plan      # Preview
terraform apply -auto-approve   # Deploy
terraform destroy -auto-approve # Destroy
```
