
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }

  backend "s3" {
    bucket       = "devops-tf-state-1682"
    key          = "network.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }

}