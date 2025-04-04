variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)

}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  default     = "your-key-pair"
}
variable "vpc_name" {
  description = "The Name of the VPC"
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
}


variable "project" {
  description = "Project name"
  type        = string
}
variable "app_name" {
  description = "Application name"
  type        = string
}


variable "is_iam_role_enebled" {
  type = bool
}

variable "is_ec2_instance_enabled" {
  type = bool
}



# variable "db_name" {
#   description = "RDS database name"
#   default     = "mydb"
# }

# variable "db_username" {
#   description = "RDS database username"
#   default     = "admin"
# }

# variable "db_password" {
#   description = "RDS database password"
#   sensitive   = true
# }
