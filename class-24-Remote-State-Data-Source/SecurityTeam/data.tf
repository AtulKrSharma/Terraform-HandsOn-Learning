data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket       = "devops-tf-state-1682"
    key          = "network.tfstate"
    region       = "us-east-1"
    }
  }