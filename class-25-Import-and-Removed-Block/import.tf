
provider "aws" {
  region = "us-east-1"
}

import {
  to = aws_security_group.my-sg-atul
  id = "sg-0e88df9b3ff1cd2b3"
}
