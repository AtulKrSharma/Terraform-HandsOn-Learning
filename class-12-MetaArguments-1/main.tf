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

resource "aws_instance" "mine_ec2" {
  ami                    = "ami-07ff62358b87c7116"
  instance_type          = "t3.micro"
  tags = {
    Name = "mine_ec2_instance"
  }
  user_data =  file("${path.module}/user_data.sh")
  lifecycle {
    prevent_destroy = true
    # ignore_changes = [ tags, ami ]
    # create_before_destroy = true
    
  }
  #depends_on = [ aws_security_group.my_sg ]
}

data "aws_vpc" "main" {
  default = true
}

