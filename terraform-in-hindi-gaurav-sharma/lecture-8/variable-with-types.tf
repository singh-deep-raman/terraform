output "print_user_info" {
  value = "Hello ${var.name}, your age is ${var.age}"
}
# Below command will return error:
  # terraform plan -var 'name=Raman' -var 'age=twenty'
