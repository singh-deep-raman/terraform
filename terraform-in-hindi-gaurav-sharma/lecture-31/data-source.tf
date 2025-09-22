# data block is used to fetch the existing resources
# Here we are fetching the latest ubuntu ami id using data source
# We can use this ami id to launch our ec2 instance
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  # to get below values, you need to manually search for ubuntu ami in aws console
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"] # declare variables for better readability
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  # this data block is like a query with multiple filters, if your query matches multiple resources, it will return the most recent one because we have set most_recent = true
  # if your query matches only one resource, it will return that resource
  # if your query matches no resource, it will throw an error

}

output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu.id
}

# Usage
# resource "aws_instance" "web_instance" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"          