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

variable "iam_names" {
  type    = set(string)
  default = ["user-01", "user-02", "user-03"]
}

resource "aws_iam_user" "iam_user" {
  name  = var.iam_names[count.index]
  count = 3
  path  = "/"
}

variable "instance_set" {
  type    = set(string)
  default = ["Instance A", "Instance B"]
}

variable "instance_map" {
  type = map(string)
  default = { "prod" = "prod.com",
  "dev" = "dev.com" }
}


resource "aws_instance" "mine_ec2_list" {
  for_each      = var.instance_set
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
  tags = { Name = each.value
  }

}

resource "aws_instance" "mine_ec2_map" {
  for_each      = var.instance_map
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.small"
  tags = { Value = each.value,
    Name = each.key
  }

}
