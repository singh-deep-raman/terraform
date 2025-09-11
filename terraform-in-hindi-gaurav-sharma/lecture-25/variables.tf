variable "access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "ports" {
  description = "List of ports to allow inbound traffic"
  type        = list(number)
}

variable "ubuntu_image_id" {
  type = string
}

variable "instance_type_t3_micro" {
  type = string
}