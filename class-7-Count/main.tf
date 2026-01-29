terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.28.0"
    }
  }
}

variable "environment" {
  default = "dev"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = var.environment == "dev"? "t3.micro": "t3.small"
  tags = {
    Name = "my_ec2_machine_${count.index}"
  }

  root_block_device {
    volume_size = 9
  }
  count = 2
}
