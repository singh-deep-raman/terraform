resource "aws_key_pair" "key-pair-with-tf" {
  key_name   = "key-pair-with-tf"
  public_key = file("${path.module}/my-key-pair.pub")
}

resource "aws_instance" "web_instance" {
  ami           = "ami-02d26659fd82cf299"
  instance_type = "t3.micro"
  key_name = aws_key_pair.key-pair-with-tf.key_name # New change compared to previous lecture

  tags = {
    Name = "first-ec2-instance-using-terraform"
  }
}

# Note - SSH command to connect to EC2 instance won't work as this ec2 instance has default Security Group attached to it which doesn't allow ALL IPs