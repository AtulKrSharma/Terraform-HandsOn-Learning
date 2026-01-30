terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.28.0"
    }
  }
}

locals {
  instance_type = {
    default = "t3.micro"
    prod    = "t3.micro"
    dev     = "t3.small"
  }
}


resource "aws_instance" "mine_ec2" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = local.instance_type[terraform.workspace]
  tags = {
    Name = "mine_ec2"
  }
}
