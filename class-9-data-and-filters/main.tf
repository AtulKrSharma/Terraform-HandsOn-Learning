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

data "aws_vpc" "custom_vpc" {
  filter {
    name   = "tag:Name"
    values = ["atul-vpc"]
  }
}

data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_ami" "my_ec2_OS_image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    
    name= "name"
    values =["amzn2-ami-ecs-*"]
  }



    filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.my_ec2_OS_image.image_id
  instance_type = "t3.micro"
  tags = {
    Name = "ec2_name"
  }
  root_block_device {
    volume_size           = 30
  }
}



