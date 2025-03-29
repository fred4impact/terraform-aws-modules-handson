# HTTPS Security Group (Port 443)
# data "http" "my_ip" {
#   url = "https://ifconfig.me/ip"
# }

module "https_sg" {
  source = "./modules/security-group"

  vpc_id                     = module.vpc.vpc_id
  security_group_name        = "https-sg"
  security_group_description = "Security group for HTTPS traffic"

  ingress_rules = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTPS from anywhere"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

# HTTP Security Group (Port 80)
module "http_sg" {
  source = "./modules/security-group"

  vpc_id                     = module.vpc.vpc_id
  security_group_name        = "http-sg"
  security_group_description = "Security group for HTTP traffic"

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP from anywhere"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

# SSH Security Group (Port 22)
module "ssh_sg" {
  source = "./modules/security-group"

  vpc_id                     = module.vpc.vpc_id
  security_group_name        = "ssh-sg"
  security_group_description = "Security group for SSH access"

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # Replace with your actual IP
      description = "Allow SSH from my IP"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}



module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id               = module.vpc.vpc_id
  public_subnets       = module.vpc.public_subnets
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = module.iam.ec2_instance_profile_name
  vpc_security_group_ids = [
    module.https_sg.security_group_id,
    module.http_sg.security_group_id,
    module.ssh_sg.security_group_id
  ]
  project  = var.project
  app_name = var.app_name
}



module "iam" {
  source = "./modules/iam"
}

# module "alb" {
#   source = "./modules/alb"

#   vpc_id          = module.vpc.vpc_id
#   public_subnets  = module.vpc.public_subnets
#   ec2_instance_ids = module.ec2.ec2_instance_ids
# }

# module "rds" {
#   source = "./modules/rds"

#   vpc_id          = module.vpc.vpc_id
#   private_subnets = module.vpc.private_subnets
#   db_name         = var.db_name
#   db_username     = var.db_username
#   db_password     = var.db_password
# }
