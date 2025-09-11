resource "aws_instance" "web_instance" {
  ami                    = var.ubuntu_image_id
  instance_type          = var.instance_type_t3_micro
  key_name               = aws_key_pair.key-pair-with-tf.key_name
  vpc_security_group_ids = [aws_security_group.security-group-custom.id]

  tags = {
    Name = "ec2-instance-with-user-data"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install nginx -y
              sudo echo "Hello from Terraform" > /usr/share/nginx/html/index.html
              EOF

  # File provisioning happens after the instance is created and is reachable
  # If provisioner fails, the resource is marked as TAINTED that's why we were suggested not to mark any resource as TAINTED
  provisioner "file" {
    source      = "../terraform-commands.MD"
    destination = "/tmp/README.md"
    # We need to specify connection details for the provisioner to connect to the instance
    # it is like SSH -i <private-key> ubuntu@<public-ip> thing we do from terminal
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/my-key-pair")
      host        = self.public_ip
      # We didn't specify 'aws_instance.web_instance.public_ip' which we have been doing so far with other attributes like key_name & security_group
      # The primary reason is it will create circular dependency, hence 'self' keyword is used
    }
  }
}