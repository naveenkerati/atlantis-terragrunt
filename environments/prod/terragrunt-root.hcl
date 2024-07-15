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
  region  = "us-west-2"
  profile = "okta2aws"
  assume_role {
    role_arn     = "arn:aws:iam::164195533089:role/SSOAdminRole"
  }
  default_tags {
    tags = {
      #Setting this metadata tag here to make sure we don't miss it on any resource
      #Terrafom always updating as the same tag set in labels module.
      #wd-finops-metadata = format("perftools_%s_%s", lower(local.env), lower(local.purpose))
      terraform  = true,
      managed_by = "${path_relative_to_include()}"
    }
  }
}
EOF
}