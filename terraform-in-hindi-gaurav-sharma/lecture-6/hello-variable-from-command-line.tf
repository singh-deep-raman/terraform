# You can pass value from command line using -var option like "terraform plan -var 'username=raman' -var 'emailId=raman111092@gmail.com'"
# If you skip any variable which is not having default value then it will ask you to enter the value during plan or apply phase.
output "print_username" {
  value = var.username
}

output "print_emailId" {
  value = "Your email id is ${var.emailId}"
}