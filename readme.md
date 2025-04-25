# tf-aws-ec2-linux

This repository contains Terraform code to provision EC2 instances in AWS. It demonstrates key infrastructure components such as IAM roles and policies, security groups, instance profiles.

## 🚀 Features

- Modular and reusable infrastructure components
- Launch single or multiple EC2 instances with different configurations
- Create and attach custom and managed IAM policies
- Set up security groups with dynamic ingress and egress rules or attach already existing ones.
- Inject user data with templated scripts

## 📁 Folder Structure

```
.
├── backend.tf              # Remote state backend using S3
├── terraform.tf            # Required provider configuration
├── variables.tf            # Input variable declarations
├── variables.tfvars        # Example values for variables
├── default-tags.tf         # default tags
├── iam.tf                  # IAM role, instance profile, and policies
├── security-groups.tf      # Security group with ingress/egress rules
├── main.tf                 # EC2 instances creation logic
├── policies/               # Custom IAM policies in JSON format
└── user_data/              # User data templates for EC2 instances
```

## 🚦 Usage

1. **Initialize Terraform**
   ```bash
   terraform init
   ```
   
2. **Create a workspace**
   ```bash
   terraform workspace new <workspace-name>
   ```

3. **Edit the _variables.tfvars_ file**
   
4. **Review the execution plan**
   ```bash
   terraform plan --var-file=variables.tfvars
   ```

5. **Apply the configuration**
   ```bash
   terraform apply --var-file=variables.tfvars
   ```

6. **Destroy the infrastructure (when needed)**
   ```bash
   terraform destroy --var-file=variables.tfvars
   ```

## 📜 Variables Explained

| Variable               | Type    | Description                                                       |
|------------------------|---------|-------------------------------------------------------------------|
| `already_existing_role`| string  | Name of the already existing role for EC2                         |
| `vpc_id`               | string  | ID of the VPC where resources will be launched                    |
| `sg_name`              | string  | Name of the security group                                        |
| `sg_inbound_rules`     | map     | Map of inbound security group rules (protocol, ports, CIDRs)      |
| `instances`            | map     | Map of instance configurations including AMI, type, subnet, etc.  |
| `iam_instance_profile` | string  | Name of the IAM instance profile to associate with EC2 instances  |
| `ec2_role_name`        | string  | New IAM role name that EC2 will assume (if already_existing_role not provided)                               |
| `managed_policy_arns`  | list    | List of ARNs of managed IAM policies to attach                    |

---

## 📥 Variable: `instances`

This variable is a map of named EC2‐instance definitions; each entry in the map will produce one AWS EC2 instance with its own AMI, sizing, storage, networking, and tags.

```hcl
variable "instances" {
  type = map(object({
    ami                    = string
    instance_type          = string
    key_name               = string
    subnet_id              = string
    vpc_security_group_ids = optional(list(string), [])
    root_block_device = object({
      volume_size = number
      volume_type = string
    })
    ebs_block_device = optional(list(object({
      device_name = string
      volume_size = number
      volume_type = string
    })), [])
    tags = optional(map(string), {})
  }))
}
```

## 🔐 Custom IAM Policies

You can add additional fine-grained IAM policies in the `policies/` directory as JSON files. These will be automatically picked up by Terraform and attached to the IAM role assigned to EC2 instances.

Example custom policy file path:
```
policies/S3ReadOnly.json
```