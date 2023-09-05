locals  {
  backend_region = "ap-southeast-2"
}
terraform {
  # Deploy version v0.0.3 in stage
  source = "git::git@github.com:LanceXuanLi/searchingJob.git//terraform/backend_moudle?ref=master"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.backend_region}"
}
EOF
}

inputs = {
  backend_bucket = "backendtest0904"
  backend_key  = "simple-web"
  backend_region = local.backend_region
  lock_table = "backendtest0904"
}