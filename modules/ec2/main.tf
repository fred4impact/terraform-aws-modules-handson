resource "aws_instance" "web" {
  count = length(var.public_subnets)

  ami                    = "ami-0c55b159cbfafe1f0" # Replace with your desired AMI
  instance_type          = var.instance_type
  subnet_id              = var.public_subnets[count.index]
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = var.key_name
  iam_instance_profile   = var.iam_instance_profile
  tags = {
    Name = "web-instance-${count.index}"
  }
}

resource "aws_security_group" "web_sg" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "web-sg"
  }
}
