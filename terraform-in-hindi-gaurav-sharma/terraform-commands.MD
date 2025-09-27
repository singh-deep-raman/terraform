# Terraform Commands

---

## 1. `terraform init`
Initializes a Terraform working directory.

---

## 2. `terraform plan`
Creates an execution plan, showing what actions Terraform will take.

### Pass a list variable from the command line:
```sh
terraform plan -var 'users=["Raman","Shyam","Mohan"]'
```

### Pass a list variable interactively:
```sh
terraform plan
Enter value for users: ["Raman","Shyam","Mohan"]
```

### Pass a map variable from the command line:
```sh
terraform apply -var 'user_age_map={gaurav=24,ankit=26,rohan=28}'
# or
terraform plan -var 'user_age_map={"abc":10, "bcd":20, "cde":15}'
```

### Pass variables from a file:
```sh
terraform plan -var-file="develop.tfvars"
```

---

## 3. `terraform apply`
Applies the changes required to reach the desired state.

---

## 4. `terraform validate`
Validates the configuration files.

---

## 5. `terraform fmt`
Automatically formats configuration files to the canonical style.

---

## 6. `terraform providers`
Lists the providers required.

---

## 7. `terraform destroy`
Destroys Terraform-managed infrastructure.

### Destroy a specific resource:
```sh
terraform destroy --target=github_repository.first_repo_in_github_using_terraform --auto-approve
```

### Destroy all resources:
```sh
terraform destroy
```

---

## 8. `terraform show`
Shows the content of the `.tfstate` file.

---

## 9. `terraform refresh`
Updates the state file when a resource is changed outside Terraform.

---

## 10. `terraform output`
Displays output values defined in the output block.

- Show all outputs:
  ```sh
  terraform output
  ```
- Show a specific output:
  ```sh
  terraform output <output_name>
  ```
- Show outputs in JSON format:
  ```sh
  terraform output -json
  ```
- Save outputs to a file:
  ```sh
  terraform output -json > output.json
  ```
- View file content:
  ```sh
  cat output.json
  ```
- Pretty print with jq (requires jq installed):
  ```sh
  jq . output.json
  jq .print_repo_ssh_clone_url.value output.json
  ```

> **Note:**  
> The `terraform output` command only works after `terraform apply` has been executed successfully and the state file with output blocks is created.  
> Alternatively, you can see output values in the `terraform.tfstate` file directly, but it is not recommended.

---

## 11. `terraform console`
Opens an interactive console to query the state file, output values, resource attributes, etc.

---

## 12. Other Useful Commands

- Format all `.tf` files in the current directory:
  ```sh
  terraform fmt
  ```
- Check the type of a file:
  ```sh
  file <filename>
  ```

---

## 13. terraform taint

- This command marks a resource tainted so that when next terraform apply command is executed, the marked resource is recreated (destroying old one first and creating a new one)
  ```sh
  terraform taint aws_security_group.sg-name
  ```
- Terraform don't recommend to use this command

## 14. terraform graph
- This command is used to create a visulization of our infrastructure
- You need to have graphviz installed to generate graphs, use below command to install
```sh
        brew install graphviz
```
- Command to generate graph in pdf
```sh
terraform graph | dot -Tpdf > filename.pdf
```
- Command to generate graph as an image
```sh
terraform graph | dot -Tsvg > filename.svg
```

## 15. terraform workspace <options>
- This command is used to perform actions around workspaces. We need workspace while working with different development environments like dev, prod etc
- It will create a .terraform.tfstate.d directory where terraform.tfstate file will be created for the particular workspace
- By default a workspace is created by terraform with name 'default' for which terraform.tfstate file is under root directory of the project, rest workspace specific tfstate files will be in their respective folders

- Command to list all workspaces
```sh
terraform workspace list
```

- Command to create a workspace
```sh
terraform workspace new workspace-name
```

- Command to show current workspace
```sh
terraform workspace show
```

- Command to switch workspace
```sh
terraform workspace select workspace-name
```

- Command to delete workspace
```sh
terraform workspace delete workspace-name
```
