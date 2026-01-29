variable "var_ami" {
  description = "variable for ami"
  type        = string
}

variable "var_instance_type" {
  description = "variable for instance_type"
  type        = string
  default     = "t2.micro"
}

variable "var_region" {
  description = "variable for region"
  type        = string
}

variable "var_associate_public_ip_address" {
  description = "value"
  type        = bool
  default     = false
}
