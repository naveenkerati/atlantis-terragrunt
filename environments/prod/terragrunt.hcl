generate "provider" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.30.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}
provider "aws" {
  region  = "us-east-1"
  default_tags {
    tags = {
      #Setting this metadata tag here to make sure we don't miss it on any resource
      terraform  = true,
      managed_by = "${path_relative_to_include()}"
    }
  }
}
EOF
}