variable "username" {}
variable "emailId" {
}

output "print_username" {
  value = var.username
}

output "print_emailId" {
  value = "Your email id is ${var.emailId}"
}