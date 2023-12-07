terraform {
  backend "s3" {
    bucket      = "silver-terraform-back"
    key         = "dev/apne2/ec2/jenkins/terraform.tfstate"
    region      = "ap-northeast-2"
#    role_arn    = "{ASSUMED_ROLE}"
    max_retries = 3
  }
}
