variable "my_dynamic_ports" {
  type    = list(number)
  default = [8200, 8201, 8300, 9200, 9500, 80]

}

variable "my_protocol" {
  type    = string
  default = "tcp"
}

variable "my_cidr_block" {
  default = ["0.0.0.0/0"]

}