# Security Group is associated to instances to control inbound and outbound traffic
# By default, when we create an EC2 instance, it gets associated with default security group
resource "aws_security_group" "security-group-using-tf" {
  name        = "security-group-using-tf"
  description = "Allow TLS inbound traffic and all outbound traffic"

  # As per terraform, ingress block should not be used and use aws_vpc_security_group_ingress_rule resource to define such rules
  # Also you can use loops to define multiple rules
  ingress {
    description = "Allowing 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allowing 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allowing 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allowing 3306"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allowing 27017"
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}