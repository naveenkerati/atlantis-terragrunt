include "root" {
  path = find_in_parent_folders("terragrunt-root.hcl")
}
terraform {
  source = "../../../modules/null_resource"
}

inputs = {
  # Any variables your Terraform module requires
}
