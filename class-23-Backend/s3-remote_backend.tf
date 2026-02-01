terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }
  backend "s3" {
    bucket       = "devops-tf-state-1682"
    key          = "prod.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}

locals {
  my_region = "us-east-1"
}

provider "aws" {
  region = local.my_region
}

data "aws_vpc" "main" {
  default = true
}

resource "aws_security_group" "my_sg" {
  name        = "my_sg_name"
  description = "Allow TLS inbound traffic at 80 and all outbound traffic"
  vpc_id      = data.aws_vpc.main.id

  tags = {
    Name = "my_sg_tag"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_80" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4         = "0.0.0.0/0" #data.aws_vpc.main.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
