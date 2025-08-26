variable "users" {
  type = list(string)
}
# Syntax to pass list variable from command line:
    # terraform plan -var 'users=["Raman","Shyam","Mohan"]'
# Syntax to pass list variable without -var parameter
    # terraform plan
    # Enter value for users: ["Raman","Shyam","Mohan"]