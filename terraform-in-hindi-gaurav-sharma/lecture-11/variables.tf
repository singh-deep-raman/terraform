variable "input_name" {}
variable "user_age_map" {
  type = map(number)
  default = {
    gaurav = 24
    ankit  = 26
    rohan  = 28
  }
}