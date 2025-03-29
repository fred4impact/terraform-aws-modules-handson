# terraform {
#   backend "s3" {
#     bucket         = "dev-terraform-state-bucket-0325"  # Same as your S3 bucket name
#     key            = "dev/terraform.tfstate"  # Path inside the bucket
#     region         = "us-east-1"  # Change to your preferred AWS region
#     dynamodb_table = "terraform-state-lock"
#     encrypt        = true
#   }
# }
