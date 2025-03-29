variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
  default     = ["subnet-12345678", "subnet-87654321"] # Example subnet IDs
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string

}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}
variable "project" {
  description = "Project name"
  type        = string
}
variable "app_name" {
  description = "Application name"
  type        = string
}


