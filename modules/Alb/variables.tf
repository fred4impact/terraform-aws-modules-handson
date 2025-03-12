variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "ec2_instance_ids" {
  description = "List of EC2 instance IDs"
  type        = list(string)
}
