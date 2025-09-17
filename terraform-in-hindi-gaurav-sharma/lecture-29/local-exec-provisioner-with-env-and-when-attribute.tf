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

  provisioner "local-exec" {
    command = "echo The instance is created with ID: ${self.id} and public IP: ${self.public_ip} > /tmp/instance-details.txt"
  }

  provisioner "local-exec" {
    working_dir = "/tmp" # You can specify in which working directory you want to run the command
    command     = "echo ${self.public_ip} is my public ip"
  }

  provisioner "local-exec" {
    interpreter = ["/usr/bin/python3", "-c"]
    command     = "print('Hello from python script')"
  }

  # By default, local-exec runs only during resource creation. To run it during resource destruction, use the 'when' attribute.
  provisioner "local-exec" {
    when    = destroy # it runs before destroying the resource, generally to back up some data or other cleanup tasks
    command = "echo local-exec during destroy"
  }

  # local-exec with environment variablesca
  provisioner "local-exec" {
    command = "env > /tmp/env.txt"
    environment = {
      env_name = "env_value"
    }
  }
}