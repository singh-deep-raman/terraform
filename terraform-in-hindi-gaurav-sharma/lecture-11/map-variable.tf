output "print_map_variable" {
  value = "Hi my name is ${var.input_name} and my age is ${lookup(var.user_age_map, var.input_name)}"
}