resource "aws_security_group" "security-group-custom" {
  name        = "security-group-custom"
  description = "Allow TLS inbound traffic and all outbound traffic"

  dynamic "ingress" { # the label here becomes the default iterator name
    for_each = var.ports
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