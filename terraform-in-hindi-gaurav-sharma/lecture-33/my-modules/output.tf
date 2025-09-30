output "webserver-public-ip" {
  value = aws_instance.web_instance.public_ip
}