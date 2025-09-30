# terraform modules are also initilized using terraform init command
# modules are also saved in .terraform directory just like providers
resource "aws_instance" "web_instance" {
  ami                    = var.ami_id # making it dynamic so that every consumer of module can use their own AMI
  instance_type          = "t3.micro" # if you feel, every consumer of you module should use t2.micro instance type then you can hardcode it here otherwise you can make it variable
}