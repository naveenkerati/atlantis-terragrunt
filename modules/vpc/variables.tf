variable "aws_region" {
  description = "AWS region for VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Set to true to create a NAT gateway"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "subnets" {
  type = list(object({
    subnet_name = string
    subnet_cidr = string
    subnet_az   = string
  }))
  description = <<EOT
List of subnets to create, where each subnet is defined as:
{
  subnet_name = "..."
  subnet_cidr = "..."
  subnet_az   = "..."
}
EOT
}