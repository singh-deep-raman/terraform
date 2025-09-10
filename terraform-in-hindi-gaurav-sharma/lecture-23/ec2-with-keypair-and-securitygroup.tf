resource "aws_security_group" "security-group-custom" {
  name        = "security-group-custom"
  description = "Allow TLS inbound traffic and all outbound traffic"

  dynamic "ingress" { # the label here becomes the default iterator name
    for_each = [443, 80, 22, 3306, 27017]
    iterator = port # Changing default iterator name from 'ingress' to 'port'
    content {
      description = "Allowing ${port.value}"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # We need to allow all outbound traffic to access internet
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "changing-name-to-check"
  }
}

resource "aws_key_pair" "key-pair-with-tf" {
  key_name   = "key-pair-with-tf"
  public_key = file("${path.module}/my-key-pair.pub")
}

resource "aws_instance" "web_instance" {
  ami                    = "ami-02d26659fd82cf299"
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.key-pair-with-tf.key_name
  vpc_security_group_ids = [aws_security_group.security-group-custom.id] # This is the main line associating security group to the instance

  tags = {
    Name = "first-ec2-instance-using-terraform"
  }
}

