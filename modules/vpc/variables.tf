variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}\\/([0-9]|[1-2][0-9]|3[0-2])$", var.vpc_cidr))
    error_message = "The VPC CIDR must be a valid CIDR block (e.g., 10.0.0.0/16)."
  }
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  # type        = list(string)

  # validation {
  #   condition = alltrue([
  #     for cidr in var.public_subnet_cidrs : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}\\/([0-9]|[1-2][0-9]|3[0-2])$", cidr))
  #   ])
  #   error_message = "Each public subnet CIDR must be a valid CIDR block (e.g., 10.0.1.0/24)."
  # }
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  # type        = list(string)

  # validation {
  #   condition = alltrue([
  #     for cidr in var.private_subnet_cidrs : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}\\/([0-9]|[1-2][0-9]|3[0-2])$", cidr))
  #   ])
  #   error_message = "Each private subnet CIDR must be a valid CIDR block (e.g., 10.0.3.0/24)."
  # }
}

variable "vpc_name" {
  description = "The Name of the VPC"
}
