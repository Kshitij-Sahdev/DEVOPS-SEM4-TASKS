# Terraform Modular Environment AWS Infrastructure

Modular Terraform project for AWS infrastructure across `dev`, `prod`, and `test` environments. Focuses on reuse, clarity, and scalability.

---

# Root Structure
```bash
task 3/
|--- main.tf          # Core infrastructure using reusable modules (VPC, EC2, RDS).
|--- variables.tf     # Root input variables.
|--- backend.tf       # Remote state backend config (e.g., S3, DynamoDB).
|--- provider.tf      # Provider settings (e.g., AWS region).
|--- output.tf        # Root module output values (e.g., ALB DNS, instance IPs).
|--- local.tf         # Local values (e.g., tags, common naming, computed values).
|----------- modules/ # Reusable Terraform modules
| |---- ec2/ 
| |---- eip/ 
| |---- nat/ 
| |---- s3/ 
| |---- sg/ 
| |---- subnet/ 
| |---- vpc/ 
| |---- igw/
|----------- dev/     # Development environment configuration
| |---- dev.tfvars 
|----------- staging/ # Staging environment configuration
| |---- staging.tfvars
|----------- test/    # Testing environment configuration
| |---- test.tfvars
```
# Module Structure
Standard structure for modules (e.g., `ec2`, `vpc`):
```bash
| |-------- ec2 (module name)
| |-- main.tf      # Defines module resources.
| |-- output.tf    # Module output values.
| |-- variables.tf # Module input variables.
```

# Env Specific files

Each environment (`dev`, `staging`, `test`) uses a `.tfvars` file:

### - `{env_name}.tfvars`
Assigns values to variables in `variables.tf` for the specific environment.

