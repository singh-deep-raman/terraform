# you need to have aws cli installed and configured on your machine for this to work
# After installation, run `aws configure` command to configure your aws credentials
# you can also set environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY instead of using
terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-raman"
    key    = "terraform.tfstate" # name of the tfstate file in the bucket
    region = "ap-south-1"
  }
}