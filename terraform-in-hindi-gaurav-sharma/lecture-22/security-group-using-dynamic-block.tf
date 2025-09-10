resource "aws_security_group" "security-group-using-dynamic-block" {
  name        = "security-group-using-dynamic-block"
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

  tags = {
    Name = "changing-name-to-check"
  }
}