terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.28.0"
    }

  }
}

variable "map_of_amis" {
  type        = map(string)
  description = "this is map of the amis to be selected"
  default = {
    "name1"   = "ami-123"
    "name11"  = "ami-07ff62358b87c7116"
    "name111" = "ami-321"
  }

}

provider "aws" {
  region = local.my_regions.primary
}

variable "tags" {
  type    = list(string)
  default = ["firstec2", "secondec2"]
}


resource "aws_instance" "ec2" {
  ami           = lookup(var.map_of_amis, "name11")
  instance_type = "t3.micro"
  tags = {
    Name = "my_tag_${element(var.tags, count.index)}"
  }
  count = length(var.tags)
}

# resource "aws_iam_user_policy" "lb_ro" {
#   name = "test_user"
#   user = aws_iam_user.lb.name

#   # Terraform's "jsonencode" function converts a
#   # Terraform expression result to valid JSON syntax.
#   # policy = jsonencode(file("./iam_lb_policy.json"))
#   policy = file("${path.module}/iam_lb_policy.json")
# }

# resource "aws_iam_user" "lb" {
#   name = "loadbalancer"

# }

