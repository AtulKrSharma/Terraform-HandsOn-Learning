resource "aws_security_group" "my_sg" {
  name        = "my_sg_name"
  description = "Allow TLS inbound traffic at 80 and all outbound traffic"
  vpc_id      = data.aws_vpc.main.id

  tags = {
    Name = "vnet-${var.envs_child}"
  }
}
data "aws_vpc" "main" {
default= true  
}