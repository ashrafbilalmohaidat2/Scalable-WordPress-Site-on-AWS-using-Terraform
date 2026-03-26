# WordPress 3-Tier Architecture on AWS

A production-ready WordPress deployment using Terraform with a three-tier architecture on AWS.

## Architecture

This project deploys WordPress using a three-tier architecture:

- **Presentation Tier**: Application Load Balancer (ALB) in public subnets
- **Application Tier**: EC2 instances with Auto Scaling in private subnets
- **Data Tier**: RDS MySQL database and EFS for shared storage in database subnets

![Architecture Diagram](ThreeTier-Wordpress%20(1).png)

## Features

- High availability across multiple availability zones
- Auto Scaling for EC2 instances
- Application Load Balancer for traffic distribution
- RDS MySQL for database
- EFS for shared WordPress files
- NAT Gateway for outbound internet access
- EC2 Instance Connect Endpoint for secure SSH access
- Comprehensive security groups

## Prerequisites

- AWS Account
- Terraform >= 1.0
- AWS CLI configured with appropriate credentials

## Quick Start

1. Clone the repository
2. Create `secret.tfvars` file:
```hcl
database-username = "your_db_username"
database-password = "your_db_password"
database-name     = "wordpress"
```

3. Initialize Terraform:
```bash
terraform init
```

4. Review the plan:
```bash
terraform plan -var-file="secret.tfvars"
```

5. Deploy:
```bash
terraform apply -var-file="secret.tfvars"
```

## Configuration

Key variables can be customized in `variables.tf`:

- `region`: AWS region (default: us-east-1)
- `vpc-cidr-block`: VPC CIDR (default: 10.0.0.0/16)
- `instance-type`: EC2 instance type (default: t3.micro)
- `image-id`: AMI ID for EC2 instances

## Outputs

After deployment, Terraform outputs the ALB DNS name to access your WordPress site.

## Security

- Database credentials stored in `secret.tfvars` (excluded from git)
- Security groups restrict traffic between tiers
- Private subnets for application and database tiers
- NAT Gateway for secure outbound traffic

## Clean Up

To destroy all resources:
```bash
terraform destroy -var-file="secret.tfvars"
```

## License

This project is open source and available under the MIT License.
