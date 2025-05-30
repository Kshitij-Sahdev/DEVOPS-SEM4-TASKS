# Terraform Modular Environment AWS Infrastructure

This project demonstrates a modular approach to provisioning AWS infrastructure using Terraform. It is structured to support multiple environments (`dev`, `prod`, and `test`) while promoting reuse, clarity, and scalability.

---

# Root Structure
```bash
task 3/
|--- main.tf          # Core infrastructure definitions using reusable modules (VPC, EC2, RDS, etc.)
|--- variables.tf     # Declares input variables used across the root configuration.
|--- backend.tf       # Configures remote state backend (e.g., S3 bucket with DynamoDB for state locking).
|--- provider.tf      # Specifies provider settings (e.g., AWS region, credentials).
|--- output.tf        # Defines the output values from the root module (e.g., ALB DNS, instance IPs).
|--- local.tf         # Declares local values (e.g., tags, common naming conventions, or computed values).
|----------- modules/ # Reusable Terraform modules
| |---- ec2/ 
| |---- eip/ 
| |---- nat/ 
| |---- s3/ 
| |---- sg/ 
| |---- subnet/ 
| |---- vpc/ 
| |---- igw/
|----------- dev/ # Development environment configuration
| |---- dev.tfvars 
|----------- staging/ # Production environment
| |---- staging.tfvars
|----------- test/ # Testing environment
| |---- test.tfvars
```
# Module Structure
This is how the structure of every module in the file "module" (ec2, eip, nat, etc.) Looks like: 
```bash
| |-------- ec2 (module name)
| |-- main.tf      # Defines the actual resources to be created within the module.
| |-- output.tf    # Declares the input variables required by the module.
| |-- variables.tf # Defines the output values that the module exports for use by other modules or the root configuration.
```

# Env Specific files

The `dev` environment (and also `staging` and `test`) includes the following Terraform configuration file:


### - `{env_name}.tfvars`
Assigns literal values to variables declared in `variables.tf`. Each environment (`dev`, `prod`, `test`) will have its own values appropriate for its use.

