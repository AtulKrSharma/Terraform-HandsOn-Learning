# This ec2 needs to be removed from here and handed over to Dhani team

# resource "aws_instance" "ec2" {
#   ami           = "ami-07ff62358b87c7116"
#   instance_type = "t3.micro"
#   tags = {
#     Name = "ec2_toberemoved"
#   }
# }

removed {

  from = aws_instance.ec2
  lifecycle {
    destroy = false
  }
  
}