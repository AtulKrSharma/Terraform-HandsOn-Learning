resource "aws_instance" "ec2" {
  ami           = var.my_ami
  instance_type = var.my_instance_type
  tags = {
    Name = "ec2_name"
  }
  root_block_device {
    volume_size = var.vol_size
    volume_type = var.vol_type
    delete_on_termination = var.del_on_terminate
  }
}