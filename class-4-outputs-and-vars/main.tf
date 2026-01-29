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

resource "aws_eip" "my_eip" {
  domain = "vpc"
}

output "eip_ips_object" {
  value = {
    "public_IP" : aws_eip.my_eip.public_ip,
    "private_IP" : aws_eip.my_eip.domain
    "my_var" : var.my_var
  }
}

output "eip_ips_array" {
  value = [aws_eip.my_eip.public_ip, aws_eip.my_eip.domain, var.my_var]
}

