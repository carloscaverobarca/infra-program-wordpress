## Use your AWS account profile
variable "profile" {
  default = ""
}

##please use your region than EU Central
variable "region" {
  default = "eu-central-1"
}

variable "instance" {
  default = "t2.micro"
}

variable "private_key_aws_path" {
  type = string
  default = "~/.ssh/mykeytest.pem"
}

variable "ansible_user" {
  default = "ubuntu"
}

variable "aws_sg_name" {
  type = string
  default = "web_ccb_sg"
}