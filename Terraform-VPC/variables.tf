variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR range"
  type        = string
}

variable "subnet_cidrs" {
  description = "Subnet CIDRs"
  type        = list(string)
}

variable "subnet_names" {
  description = "Subnet names"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
