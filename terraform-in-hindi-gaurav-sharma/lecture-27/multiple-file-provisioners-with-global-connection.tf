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

  # This becomes a global connection block for all the provisioners inside this resource
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/my-key-pair")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "../terraform-commands.MD"
    destination = "/tmp/README.md"
  }

  provisioner "file" {
    content     = "this is dummy content from terraform" # You need not to specify file always, you can directly specify content
    destination = "/tmp/dummy-content.md"
  }
}