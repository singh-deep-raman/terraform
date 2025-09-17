resource "aws_key_pair" "key-pair-with-tf" {
  key_name   = "key-pair-with-tf"
  public_key = file("${path.module}/my-key-pair.pub")
}