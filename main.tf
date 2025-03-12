
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# module "iam" {
#   source = "./modules/iam"
# }

# module "ec2" {
#   source = "./modules/ec2"

#   vpc_id          = module.vpc.vpc_id
#   public_subnets  = module.vpc.public_subnets
#   instance_type   = var.instance_type
#   key_name        = var.key_name
#   iam_instance_profile = module.iam.ec2_instance_profile_name
# }

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
