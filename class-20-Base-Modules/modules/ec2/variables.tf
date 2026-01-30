

variable "del_on_terminate" {
  description = "del_on_terminate"
  default     = true
  type        = bool
}

variable "vol_type" {
  description = "vol_type"
  default     = "gp3"
  type        = string
}

variable "vol_size" {
  description = "vol_size"
  default     = 8
  type        = number
}

variable "my_instance_type" {
  description = "my_instance_type"
  default     = "t3.small"
  type        = string
}

variable "my_ami" {
    type = string
    description = "my_ami"
}
