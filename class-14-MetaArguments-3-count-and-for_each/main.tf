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

//count for exactly same copies of the resource
resource "aws_instance" "ec2" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
  tags = {
    Name = "ec2_name_${count.index}"
  }
  count = 3
}

//for_each

variable "my_vars" {
  description = "value"
  type = set(string)
  default = ["atul", "despal","rajesh","rakesh"]
}

resource "aws_instance" "ec2_instance" {
  for_each = var.my_vars
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
  tags = {
    Name = each.value
  }
}

variable "users" {
type =set(string)
default = [ "alice","bob","johh","james","will" ]
}

resource "aws_iam_user" "lb" {
  for_each = var.users
  name = each.value
  path = "/system/"
}



