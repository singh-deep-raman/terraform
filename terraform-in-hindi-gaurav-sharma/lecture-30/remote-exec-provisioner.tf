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
    content     = "this is dummy content from terraform" 
    destination = "/tmp/dummy-content.md"
  }

  provisioner "local-exec" {
    command = "echo The instance is created with ID: ${self.id} and public IP: ${self.public_ip} > /tmp/instance-details.txt"
  }

  provisioner "local-exec" {
    working_dir = "/tmp" 
    command     = "echo ${self.public_ip} is my public ip"
  }

  provisioner "local-exec" {
    interpreter = ["/usr/bin/python3", "-c"]
    command     = "print('Hello from python script')"
  }

  provisioner "local-exec" {
    when    = destroy 
    command = "echo local-exec during destroy"
  }

  provisioner "local-exec" {
    command = "env > /tmp/env.txt"
    environment = {
      env_name = "env_value"
    }
  }

  # remote-exec provisioner runs commands on the remote resource, here on the created EC2 instance
  provisioner "remote-exec" {
    # way 1 to specify commands to execute on remote instance
    inline = [
      "ip addr show > /tmp/ifconfig.txt",
      "echo 'hello from remote-exec' > /tmp/remote-exec.txt"
    ]
  }

  provisioner "remote-exec" {
    # way 2 to specify commands to execute on remote instance
    script = "./test-script.sh" # specify absolute or relative path of the script
  }
}