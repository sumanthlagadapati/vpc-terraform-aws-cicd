variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "subnet_cidrs" {
  description = "CIDR blocks for subnets"
  type        = list(string)
}

variable "subnet_names" {
  description = "Names for subnets"
  type        = list(string)
}
