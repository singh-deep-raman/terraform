resource "aws_instance" "web_instance" {
  ami           = "ami-02d26659fd82cf299"
  instance_type = "t3.micro"

  tags = {
    Name = "first-ec2-instance-using-terraform"
  }
}

# This is the simplest EC2 instance you can create using terraform
# It doesn't have any security group, key pair etc.