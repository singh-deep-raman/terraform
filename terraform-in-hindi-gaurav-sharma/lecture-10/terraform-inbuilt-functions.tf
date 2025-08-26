output "print_users" {
  value = join(", ", var.users)
}

output "print_users_in_uppercase" {
  value = upper(join(", ", var.users)) # other functions: lower, title
}