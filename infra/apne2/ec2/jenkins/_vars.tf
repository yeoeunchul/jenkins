variable "env" {}
variable "name" {}
variable "owner" {}

variable "ami_owners" {}
variable "ami_filters" {}
variable "instance_type" {}
variable "key_name" {}
variable "private_ip" {}

variable "trusted_role_services" {}
variable "custom_role_policy_arns" {}

variable "http_sg_description" {}
variable "http_ingress_cidr_blocks" {}
variable "http_ingress_rules" {}
variable "http_egress_rules" {}