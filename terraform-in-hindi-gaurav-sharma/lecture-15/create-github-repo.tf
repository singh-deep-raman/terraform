# Requires terraform init command to download this plugin
# After terraform init, go inside .terraform folder to see the downloaded plugin
provider "github" {
    # There are multiple ways to authenticate with github, I am using token here
    # You can create a token from github settings -> Developer settings -> Personal access tokens -> Tokens (classic) -> Generate new token
    token = "ghp_abcdefgh" # Read this token from environment variable for better security
}

resource "github_repository" "first_repo_in_github_using_terraform" {
  name        = "test-repo-using-terraform"
  description = "First repo created using terraform"
  visibility = "public"
  auto_init  = true
}

# Some useful commands
    # terraform providers --> to check the providers used in the current configuration
    # file <filename>  --> to check the type of file
    # terraform destroy
    # terraform destroy --target=github_repository.first_repo_in_github_using_terraform --auto-approve (to delete one specific resource)
    # terraform apply --auto-approve 
    # terraform validate (to check if the configuration is valid or not)
    # terraform show (to show the content of the .tfstate file)
    # terraform refresh (when a resource is changed outside terraform, this command will update the state file, for e.g. you changed the description of the github repository manually and then want that change in .tfstate file)


