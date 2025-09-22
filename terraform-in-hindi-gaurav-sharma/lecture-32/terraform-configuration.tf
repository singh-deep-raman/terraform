# you can specify required versions as strictly or with range
terraform {
  required_version = "1.12.0" # you can specify which terraform should be used to run this code
  # change above value and run terraform commands to see the effect
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0" # you can specify which version of provider should be used to run this code
    }
  }
}