
terraform {
  source = "../../../modules/vpc" # Path to your Terraform module
}

inputs = {
  vpc_name = "my-vpc"

}
