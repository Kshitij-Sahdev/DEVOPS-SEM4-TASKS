# Terraform Task: VPC, Subnet, and EC2 Instance Creation

In this task, we create an AWS VPC, a subnet, and an EC2 instance using a modular approach. It separates resources into individual modules (`vpc`, `subnet`, and `ec2`) and uses variable files to customize deployments.

---

## Directory Structure


```bash
Task2/
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── subnet/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── main.tf
├── variables.tf
├── terraform.tfvars
└── outputs.tf
```

## Step 1: Setting Up the Child Modules
###  EC2 Module

| File                 | Purpose                                                                 |
|----------------------|-------------------------------------------------------------------------|
| `main.tf`            | Launches an EC2 instance in the given subnet with specified config      |
| `variables.tf`       | Declares variables like `ami`, `instance_type`, `subnet_id`, `name`     |
| `outputs.tf`         | Outputs EC2 instance ID                                                 |


###  VPC Module


| File                 | Purpose                                                                 |
|----------------------|-------------------------------------------------------------------------|
| `main.tf`            | Creates a VPC using the provided CIDR block and name                    |
| `variables.tf`       | Declares input variables like `cidr_block`, `name` etc.                 |
| `outputs.tf`         | Outputs the created VPC's ID                                            |

###  Subnet Module

| File                 | Purpose                                                                           |
|----------------------|-----------------------------------------------------------------------------------|
| `main.tf`            | Creates a subnet in the specified VPC with the given CIDR and AZ                  |
| `variables.tf`       | Declares input variables like `vpc_id`, `cidr_block` etc.                         |
| `outputs.tf`         | Outputs the created Subnet ID                                                     |
-------------------------------------------------------------------------------------------------------------
## Step 2: Setting Up the Root Module
###  Root Module

| File               | Purpose                                                                 |
|--------------------|-------------------------------------------------------------------------|
| `main.tf`          | Calls child modules (VPC, Subnet, EC2) and passes variables             |
| `variables.tf`     | Declares input variables (region, VPC/Subnet/EC2 configs)               |
| `terraform.tfvars` | Assigns actual values to the declared variables                         |
| `outputs.tf`       | Outputs VPC ID, Subnet ID, EC2 instance ID, and public IP               |
-----------------------------------------------------------------------------------------------------------
## Step 3: Executing the Configurations 


### 1. Initialize the project
```bash
terraform init
```

### 2. Preview the changes
```bash
terraform plan
```

### 3.Apply the changes
```bash
terraform apply -auto-approve
```

### 4. If you wish to destroy (delete) the resouces created you can run the following command:
```bash
terraform destroy -auto-approve
```
