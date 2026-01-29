#this is the example of explicit dependency
resource "aws_s3_bucket" "my_s3bucket" {
  bucket = "my-tf-test-bucket"
  tags = {
    Name        = "my_bucket123"
    Environment = "Dev"
  }
}

resource "aws_instance" "mine_ec2_for_s3" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
  depends_on    = [aws_s3_bucket.my_s3bucket]
}

#this is the example of implicit dependency

resource "aws_instance" "mine_ec2_mine" {
  ami                    = "ami-07ff62358b87c7116"
  instance_type          = "t3.micro"
  # this key is important as welll as implicit dependency
  vpc_security_group_ids = [aws_security_group.my_sg.id]
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