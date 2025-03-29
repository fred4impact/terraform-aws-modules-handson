variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "web-sg"
}

variable "ingress_rules" {
  description = "List of ingress rules"

  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "security_group_description" {
  description = "Description for the security group"
  type        = string
  default     = "Managed by Terraform" // Providing a default value
}

variable "tags" {
  description = "Tags for the security group"
  type        = map(string)
  default     = {}
}
