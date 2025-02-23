include "root" {
  path = find_in_parent_folders("terragrunt-root.hcl")
}
terraform {
  source = "../../../modules/vpc" # Path to your Terraform module
}

inputs = {
  vpc_name = "my-vpc"

}
