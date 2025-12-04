# AWS VPC Infrastructure with Terraform & GitHub Actions CI/CD

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

## 📋 Project Overview

This project demonstrates Infrastructure as Code (IaC) by deploying a complete AWS VPC infrastructure using Terraform with automated CI/CD deployment via GitHub Actions. The architecture includes VPC, subnets, security groups, EC2 instances, and an Application Load Balancer.

## 🏗️ Architecture

### Infrastructure Components:
- **VPC**: Custom VPC with DNS support (10.0.0.0/16)
- **Subnets**: 2 public subnets across different availability zones
- **Internet Gateway**: For public internet access
- **Route Tables**: Associated with public subnets
- **Security Groups**: HTTP/HTTPS access configuration
- **EC2 Instances**: Web servers in multiple AZs
- **Application Load Balancer**: Distributes traffic across EC2 instances
- **Target Groups**: Health check configuration for instances

## 📁 Project Structure

```
vpc-terraform-aws-cicd/
├── .github/
│   └── workflows/
│       └── deploy.yml          # GitHub Actions CI/CD pipeline
├── Terraform-VPC/
│   ├── provider.tf             # Terraform & AWS provider configuration
│   ├── main.tf                 # Root module configuration
│   ├── variables.tf            # Input variable definitions
│   ├── terraform.tfvars        # Variable values
│   ├── outputs.tf              # Output definitions
│   └── modules/
│       ├── vpc/                # VPC module
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       ├── sg/                 # Security Group module
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       ├── ec2/                # EC2 module
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       └── alb/                # Application Load Balancer module
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
└── README.md
```

## 🚀 Prerequisites

- AWS Account with appropriate permissions
- Terraform >= 1.0
- Git
- GitHub account
- AWS CLI configured (for local testing)

## ⚙️ Configuration

### 1. AWS Credentials Setup

Add the following secrets to your GitHub repository:
- Go to `Settings` → `Secrets and variables` → `Actions`
- Add new repository secrets:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`

### 2. S3 Backend Configuration

Update the S3 backend in `Terraform-VPC/provider.tf`:
```hcl
backend "s3" {
  bucket = "your-terraform-state-bucket-name"  # Change this
  key    = "vpc-terraform/terraform.tfstate"
  region = "us-east-1"
}
```

### 3. Update Variables

Modify `Terraform-VPC/terraform.tfvars` as needed:
```hcl
aws_region    = "us-east-1"
vpc_cidr      = "10.0.0.0/16"
subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
subnet_names  = ["public-subnet-1", "public-subnet-2"]
ami_id        = "ami-0c55b159cbfafe1f0"  # Update to latest AMI
instance_type = "t2.micro"
```

## 📦 Deployment

### Automated Deployment (via GitHub Actions)

1. **Push to main branch**:
   ```bash
   git add .
   git commit -m "Deploy VPC infrastructure"
   git push origin main
   ```

2. The GitHub Actions workflow will automatically:
   - Initialize Terraform
   - Validate configuration
   - Format check
   - Plan infrastructure changes
   - Apply changes (on push to main)

### Manual Deployment (Local)

```bash
# Navigate to Terraform directory
cd Terraform-VPC

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Plan infrastructure
terraform plan

# Apply changes
terraform apply

# Destroy infrastructure (when needed)
terraform destroy
```

## 🔄 CI/CD Pipeline

The GitHub Actions workflow (`.github/workflows/deploy.yml`) includes:

1. **Checkout Code**: Retrieves repository code
2. **Setup Terraform**: Installs Terraform v1.5.0
3. **Configure AWS Credentials**: Authenticates with AWS
4. **Terraform Init**: Initializes backend and providers
5. **Terraform Format**: Checks code formatting
6. **Terraform Validate**: Validates configuration syntax
7. **Terraform Plan**: Shows planned infrastructure changes
8. **Terraform Apply**: Deploys infrastructure (on main branch push)

## 📊 Outputs

After successful deployment, the following outputs are available:

- `vpc_id`: VPC identifier
- `subnet_ids`: List of subnet identifiers
- `security_group_id`: Security group identifier
- `ec2_instance_ids`: List of EC2 instance identifiers
- `alb_dns_name`: Load balancer DNS name for accessing the application

## 🛡️ Security Considerations

- Store sensitive data in GitHub Secrets
- Use IAM roles with least privilege
- Enable VPC Flow Logs for monitoring
- Implement proper security group rules
- Use HTTPS in production environments
- Enable MFA for AWS accounts
- Regular security audits and updates

## 🧪 Testing

1. Access the Application Load Balancer DNS name
2. Verify instances are healthy in the target group
3. Test failover by stopping one EC2 instance
4. Monitor CloudWatch metrics

## 🐛 Troubleshooting

### Common Issues:

**Terraform Init Fails**:
- Verify AWS credentials are correctly set
- Check S3 bucket exists and is accessible

**Apply Fails**:
- Check AWS service quotas
- Verify subnet CIDR ranges don't overlap
- Ensure AMI ID is valid for the region

**GitHub Actions Fails**:
- Verify GitHub secrets are set correctly
- Check workflow logs for detailed errors

## 📚 Resources

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is open source and available under the MIT License.

## 👤 Author

**Sumanth Lagadapati**
- GitHub: [@sumanthlagadapati](https://github.com/sumanthlagadapati)

## 🙏 Acknowledgments

- Based on DevOps best practices
- Inspired by AWS Well-Architected Framework
- Tutorial reference: [Mastering VPC Creation with Terraform & GitHub Actions](https://www.youtube.com/watch?v=v4MP7fvLw44)

---

⭐ If you found this project helpful, please consider giving it a star!
