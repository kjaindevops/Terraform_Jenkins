provider "aws" {
  region = var.aws_region
}

module "securitygroup" {
  vpc_id      = local.vpc_id
  environment = local.environment

}