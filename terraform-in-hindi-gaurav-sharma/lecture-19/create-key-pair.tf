# When you create key pair in AWS manually, it saves public key in itself and gives private key to you
# But when you create key pair using terraform, you have to provide only public key to it
resource "aws_key_pair" "my-first-key-pair" {
  key_name   = "my-first-key-pair-using-tf"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

# Generate RSA key pair locally and provide public key to terraform using file() function
# Command to generate key pair: ssh-keygen -t rsa
resource "aws_key_pair" "my-second-key-pair" {
  key_name   = "my-second-key-pair-using-tf"
  public_key = file("${path.module}/my-key-pair.pub")
}