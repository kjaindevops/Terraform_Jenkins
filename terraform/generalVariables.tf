locals {
  environment = terraform.workspace

  vpc_id = data.aws_vpc.client_vpc.id

  vpc_name = lookup(
    var.vpc_name,
    terraform.workspace,
    var.vpc_name[var.default_value],
  )
  subnet_range = lookup(
    var.subnet_range,
    terraform.workspace,
    var.subnet_range[var.default_value],
  )
}

## DataSources ##
data "aws_vpc" "client_vpc" {
  tags = {
    Name = local.vpc_name
  }
}

## Static Variables ##
variable "default_value" {
  description = "Default VPC most of the resources has."
  default     = "default"
}

variable "aws_region" {
  description = "AWS region when all resources are going to be provisioned"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "Project Instance type"
  default     = "t2.micro"
}

variable "vpc_name" {
  type = map(string)
  default = {
    "prod"     = ""
    "pre-prod" = ""
    "default"  = "kunal_vpc"
  }
}

variable "subnet_range" {
  type = map(list(string))
  default = {
    "prod"     = [""]
    "pre-prod" = [""]
    "default"  = ["172.31.32.0/20"]
  }
}