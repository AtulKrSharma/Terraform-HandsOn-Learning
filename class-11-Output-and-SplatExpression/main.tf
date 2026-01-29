terraform {
  required_version = "~>1.14.3"
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

variable "name" {
  default = "atul"
  type    = string
}

variable "age" {
  default = 40
  type    = number
}

resource "aws_iam_user" "lb" {
  name  = "loadbalancer_${count.index}"
  path  = "/system/"
  count = 3
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}
/*terraform apply -auto-approve
will be changed to 
terraform apply -replace="aws_instance.ec2" -auto-approve
in the previous versions, it's terraform taint*/

resource "aws_security_group" "my_sg" {
  name = "my_sg_name"
  tags = {
    Name = "my_sg_tag"
  }
}

output "output_values" {
  value = {

    "key1" : var.name
    "key2" : var.age
  }

}

output "names" {
  value = aws_iam_user.lb[*].name
}

output "combined" {
  value = zipmap(aws_iam_user.lb[*].name, aws_iam_user.lb[*].arn)
}
