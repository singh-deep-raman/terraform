# Sequence of execution of output blocks in multiple .tf files is not guaranteed, but mostly it is alphabetical order of file names.
output "second_output_block" {
  value = "This is the second output block"
}