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


/*prviously, if we check any external resource then complete tf script fails if that data block fails but
after check block it's just a warning [fail or pass] */

# data "http" "my_instance_type" {
#   url = "https://www.raja.ca.com"
# }

resource "aws_instance" "mine_ec2" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
}

output "aws_ec2_public_ip" {
  value = aws_instance.mine_ec2.public_ip
}

check "website_health" {
  data "http" "index" {
    url = "https://${aws_instance.mine_ec2.public_ip}"
  }
  assert {
    condition     = data.http.index.status_code == 200
    error_message = "The website is not returning a 200 OK status!"
  }
}


resource "aws_security_group" "updated_my_sg" {
  name        = "my_sg_name"
  description = "Allow TLS inbound traffic at 80 and all outbound traffic"
  tags = {
    Name = "my_sg_tag"
  }


}

##moved block for the renamed resource

moved {
  from = aws_security_group.old_my_sg
  to   = aws_security_group.updated_my_sg
}


