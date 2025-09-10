provider "github" {
  token = "ghp_token"
}

resource "github_repository" "first_repo_in_github_using_terraform" {
  name        = "test-repo-using-terraform"
  description = "First repo created using terraform"
  visibility  = "public"
  auto_init   = true
}

output "print_repo_ssh_clone_url" {
  value = github_repository.first_repo_in_github_using_terraform.ssh_clone_url # 'ssh_clone_url' attribute was taken from Attribute section of the github_repository documentation
}

output "print_repo_html_url" {
  value = github_repository.first_repo_in_github_using_terraform.html_url
}

# Some useful commands
# terraform output (to see the output values defined in output block)
# terraform output <output_name> (to see a specific output value, e.g. terraform output print_repo_ssh_clone_url)
# terraform output -json (to see the output values in json format)
# terraform output -json > output.json (to save the output values in json format to a file named output.json)
# cat output.json (to see the content of the output.json file)
# jq . output.json (to pretty print the content of the output.json file using jq tool, you need to install jq tool for this)
# jq .print_repo_ssh_clone_url.value output.json (to see a specific output value from the output.json file using jq tool)

# terraform output command only works after terraform apply command has been executed successfully and the state file is created which has output block in it
# Alternatively, you can see the output values in the state file (terraform.tfstate) directly, but it is not a good practice

# terraform console (to open an interactive console to query the state file like output values, resource attributes etc.)
# terraform fmt (to format the code in all .tf files in the current directory)