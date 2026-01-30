variable "my_ami" {
  default = "ami-0532be01f26a3de55"
  type    = string

}

variable "my_region" {
  default = "us-east-1"

}



variable "tags" {
  type = object({
    value1  = string
    value11 = string
    counter = number
  })
  default = {
    value1  = "India",
    value11 = "Canada",
    counter = 1682  //coercion is going to happen and converted to string too as it's tags
  }
}

# variable "tags_value1" {
#   default = "India"

# }

# variable "tags_value11" {
#   default = "Canada"

# }
