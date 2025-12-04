output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "Subnet IDs"
  value       = module.vpc.subnet_ids
}

output "security_group_id" {
  description = "Security Group ID"
  value       = module.sg.security_group_id
}

output "ec2_instance_ids" {
  description = "EC2 Instance IDs"
  value       = module.ec2.instance_ids
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = module.alb.alb_dns_name
}
