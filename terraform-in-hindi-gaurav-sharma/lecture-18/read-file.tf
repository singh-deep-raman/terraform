output "read_file" {
    value = file("${path.module}/example.txt") 
        # ${path.module} is used to get the current module path which is . right now
        # file() function is used to read the content of the file
}