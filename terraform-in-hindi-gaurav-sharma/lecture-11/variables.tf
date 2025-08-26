variable "input_name" {}
variable "user_age_map" {
  type = map(number)
  default = {
    gaurav = 24
    ankit  = 26
    rohan  = 28
  }
}
# How to pass map values via cmd
# terraform apply -var 'user_age_map={gaurav=24,ankit=26,rohan=28}'
# or
# terraform plan -var 'user_age_map={"abc":10, "bcd":20, "cde":15}'