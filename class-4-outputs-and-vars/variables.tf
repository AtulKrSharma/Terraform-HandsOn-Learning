variable "my_var" {
  type        = string
  description = "my var is a good variable"
  default     = "50"
}

variable "app_port" {
  default = "8080"
}

variable "ssh_port" {
  default = "22"
}

variable "ftp_port" {
  default = "21"
}

variable "my_region" {
  default = "us-east-1"

}
