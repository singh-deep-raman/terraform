module "webserver-module" {
  source = "./my-modules"
  ami_id = "ami-02d26659fd82cf299" # way 1 - to pass values to module variable
  # way 2 - use variables to pass values to module variable like below
  # ami_id = var.ami_id_for_module
}

# Get output from module, you can create output values in module and use them here, 
# without it you can't get any output from module
output "webserver-instance-id" {
  value = module.webserver-module.webserver-public-ip
}