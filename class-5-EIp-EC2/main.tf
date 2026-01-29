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
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
  # this key is important
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = {
    Name = "mine_ec2"
  }
  user_data = file("${path.module}/user_data.sh")
}

data "aws_vpc" "default_vpc" {
  default = true
}

resource "aws_security_group" "my_sg" {
  name        = "my_sg_name"
  description = "Allow TLS inbound traffic at 80 and all outbound traffic"
  vpc_id      = data.aws_vpc.default_vpc.id

  tags = {
    Name = "my_sg_tag"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_eip" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



resource "aws_eip" "my_eip" {
  instance = aws_instance.mine_ec2.id
  domain   = "vpc"
}

output "Public_IP" {
  value = aws_eip.my_eip.public_ip

}