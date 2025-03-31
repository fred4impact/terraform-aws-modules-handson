
resource "aws_iam_role" "ec2_role" {

  count = var.is_iam_role_enebled == true ? 1 : 0

  name = "ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "ec2_s3_access" {

  count = var.is_iam_role_enebled == true ? 1 : 0



  role = aws_iam_role.ec2_role[count.index].name


  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess" # Example policy
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {

  count = var.is_iam_role_enebled == true ? 1 : 0

  name = "ec2-instance-profile" # Use the correct name
  role = aws_iam_role.ec2_role[count.index].name
}
