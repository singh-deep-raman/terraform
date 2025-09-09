output "print_username" {
  value = "Hello, your username is ${var.username}"
}
# Set environment variable TF_VAR_username to set this variable like:
    # export TF_VAR_username="Raman"