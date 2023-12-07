module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = local.ec2_name

  ami                         = local.ami_id
  key_name                    = local.key_name
  instance_type               = local.instance_type
  availability_zone           = element(local.azs, 0)
  subnet_id                   = element(local.private_subnet_ids, 0)
  vpc_security_group_ids      = [module.http.security_group_id, local.default_sg_id]
  iam_instance_profile        = module.iam.iam_instance_profile_name
  associate_public_ip_address = false

  user_data  = data.template_file.userdata.rendered
  private_ip = var.private_ip

  tags = local.tags
}

# http sg
module "http" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.http_sg_name
  description = local.http_sg_description
  vpc_id      = local.vpc_id

  ingress_cidr_blocks = local.http_ingress_cidr_blocks
  ingress_rules       = local.http_ingress_rules
  egress_rules        = local.http_egress_rules

  tags = local.tags
}

# iam
module "iam" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 4.3"

  create_role             = true
  create_instance_profile = true
  role_name               = local.role_name
  role_requires_mfa       = false

  trusted_role_services = local.trusted_role_services
  custom_role_policy_arns = local.custom_role_policy_arns
}