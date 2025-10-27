resource "aws_instance" "web_instance" {
  ami                    = "ami-02d26659fd82cf299" 
  instance_type          = "t3.micro" 
}