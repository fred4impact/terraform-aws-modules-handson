# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#     }
#   }
# }

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "my-ews-baket1-0025"
    region = "us-east-1"
    key    = "dev/terraform/terraform.tfstate"
    # dynamodb_table = "Lock-Files"
    use_lockfile = true
    encrypt      = true
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# terraform {
#   backend "s3" {
#     bucket = "qa-ews-baket-usest2-0025"
#     region = "us-east-2"
#     key    = "qa/terraform/terraform.tfstate"
#     # dynamodb_table = "Lock-Files"
#     use_lockfile = true
#     encrypt      = true
#   }

#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#     }
#   }
# }
