resource "aws_security_group" "terraform-sg" {
  vpc_id      = var.vpc_id
  name        = format("terraform-%s-sg", var.environment)
  description = format("Security Group for EC2 terraform-%s", var.environment)

  tags = {
    "Name" = format("terraform-%s-sg", var.environment)
  }
}

resource "aws_security_group_rule" "allow-tcp-80-in" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = aws_security_group.terraform-sg.id
  cidr_blocks       = var.subnet_range
}