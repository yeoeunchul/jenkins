variable "backend_s3" {
  default = "silver-terraform-back"
}

variable "region" {
  default = "ap-northeast-2"
}

variable "vpc_key" {
  default = "dev/apne2/network/vpc/terraform.tfstate"
}

variable "tags" {}