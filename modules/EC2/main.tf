resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = aws_key_pair.coalfire-ec2.key_name

  root_block_device {
    volume_size = var.volume_size
  }

  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]

  tags = {
    Name = var.instance_name
  }
}

resource "aws_key_pair" "coalfire-ec2" {
  key_name   = "coalfire-keypair"
  public_key = file("${path.module}/coalfire-ec2.pub")
}


resource "aws_security_group" "ec2_security_group" {
  name        = "ec2-security-group"
  description = "Security group for EC2 instance in Sub2"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_access_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2_sg"
  }
}
