output "ec2_instance_ids" {
  value = aws_instance.web[*].id
}

output "public_ip" {
  value = aws_instance.web[*].public_ip
}

