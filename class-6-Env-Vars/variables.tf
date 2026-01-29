variable "my_var" {
  type        = string
  description = "my var is a good variable"
  default     = "50"
}

variable "app_port" {

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

variable "student" {
  description = "it's an object/map"
  type        = map(string) //map of what
  default = {
    "school" : "svms",
    "class" : "12"
   
  }
}

variable "fruits" {
  description = "it's an array/list"
  type = list(string)
}
