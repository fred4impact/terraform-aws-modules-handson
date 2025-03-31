resource "aws_instance" "web" {
  # count = 3
  count = var.is_ec2_instance_enabled == true ? 1 : 0

  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnets[count.index % length(var.public_subnets)] # Distributes across available subnets
  key_name      = aws_key_pair.terraform.key_name

  vpc_security_group_ids = var.vpc_security_group_ids
  iam_instance_profile   = var.iam_instance_profile
  user_data              = base64encode(file("${path.module}/install.sh"))


  tags = {
    Name    = "web-instance-${count.index}"
    Project = var.project
    App     = var.app_name
  }

}

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "aws_key_pair" "terraform" {
  key_name   = "terraform-key"
  public_key = file("~/.ssh/terraform-key.pub")
}
