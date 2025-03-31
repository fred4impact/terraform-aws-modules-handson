output "ec2_instance_profile_name" {
  description = "Name of the EC2 instance profile"
  value       = try(null, aws_iam_instance_profile.ec2_instance_profile[0].name)

}
