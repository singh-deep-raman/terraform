resource "aws_instance" "web_instance" {
  ami                    = var.ubuntu_image_id
  instance_type          = var.instance_type_t3_micro
  key_name               = aws_key_pair.key-pair-with-tf.key_name
  vpc_security_group_ids = [aws_security_group.security-group-custom.id]

  tags = {
    Name = "ec2-instance-with-user-data"
  }

  # This is the user data script that will run on instance launch, it is the only change from previous lecture
  # The path keeps on changing based on nginx, so cross verify the path
  # Note - if you don't specify hyphen(-) after <<, then indentation matters, so your script will fail. If you indent it. So better to use <<-EOF
          # if you don't specify hyphen(-) then remove the spaces from the script for each line
  # Use file() function and move your script to a separate file for better readability and management
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install nginx -y
              sudo echo "Hello from Terraform" > /usr/share/nginx/html/index.html
              EOF
}