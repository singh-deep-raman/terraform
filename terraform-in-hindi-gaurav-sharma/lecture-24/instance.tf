resource "aws_instance" "web_instance" {
  ami                    = var.ubuntu_image_id
  instance_type          = var.instance_type_t3_micro
  key_name               = aws_key_pair.key-pair-with-tf.key_name
  vpc_security_group_ids = [aws_security_group.security-group-custom.id] # This is the main line associating security group to the instance

  tags = {
    Name = "first-ec2-instance-using-terraform"
  }
}