terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.28.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "my_secret_pwd" {
  default = "ILOVEYOU"
}

output "output_my_secret_pwd" {
  value = var.my_secret_pwd
  sensitive = true
}

provider "vault" {
  address = ""
}

data "vault_generic_secret" "name" {
  path = "db/credentials"
  
}
resource "aws_instance" "ec2" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
  tags = {
    Name = "ec2_name"
  }
  root_block_device {
    volume_size = 9
    volume_type = "gp2"
    delete_on_termination = true
  }
}

data "aws_vpc" "default_vpc" {
  default = true
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.default_vpc.id

  tags = {
    Name = "secgrp_name"
  }
}
