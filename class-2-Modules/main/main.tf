terraform {
  required_version = "~>1.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.28.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.var_region
}

module "ec2" {
  source                          = "../modules/ec2"
  var_ami                         = "ami-07ff62358b87c7116"
  var_associate_public_ip_address = true
  var_instance_type               = "t3.micro"
  var_region                      = var.var_region
}