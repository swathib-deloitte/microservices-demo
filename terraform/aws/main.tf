resource "aws_key_pair" "scenario2_key" {
  key_name   = var.key_name
  public_key = file(pathexpand(var.public_key_path))
}

resource "aws_security_group" "scenario2_sg" {
  name        = "scenario2-online-boutique-sg"
  description = "Security group for Scenario 2 Online Boutique"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["3.27.208.148/32"]
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS access"
    from_port   = 443
    to_port     = 443
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
    Name = "scenario2-online-boutique-sg"
  }
}

resource "aws_instance" "scenario2_server" {
  ami                    = "ami-0f5ee92e2d63afc18"
  instance_type          = var.instance_type
  key_name               = aws_key_pair.scenario2_key.key_name
  vpc_security_group_ids = [aws_security_group.scenario2_sg.id]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = "scenario2-online-boutique"
  }
}
