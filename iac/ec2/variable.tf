variable "vpc_id" {}

variable "subnet_id" {}

variable "ami_id" {
  default = "ami-0c5204531f799e0c6"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "te7a"
}
