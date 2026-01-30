terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.28.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# module "ec2-instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "6.2.0"
#   subnet_id = "subnet-0487a854d641fc9c7"
#   instance_type = "t3.small"
# }

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["manju", "dhani"])

  name = "instance-${each.key}"
  instance_type = "t3.micro"
  key_name      = "queen"
  monitoring    = true
  subnet_id     = "subnet-0487a854d641fc9c7"

  tags = {
    Terraform   = "true"
    Env = "dev"
  }
}


resource "aws_instance" "ec2_via_resource" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
  tags = {
    Name = "ec2_via_resource_${(count.index)+10}"
  }
  count = 2
}