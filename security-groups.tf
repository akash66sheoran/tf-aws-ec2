resource "aws_security_group" "sg" {
  name   = var.sg_name
  vpc_id = var.vpc_id

  tags = {
    Name = var.sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "inbound_rules" {
  security_group_id = aws_security_group.sg.id
  for_each          = var.sg_inbound_rules
  cidr_ipv4         = try(each.value.cidr_ipv4, null)
  cidr_ipv6         = try(each.value.cidr_ipv6, null)
  from_port         = try(each.value.from_port, null)
  ip_protocol       = each.value.ip_protocol
  to_port           = try(each.value.to_port, null)
}

resource "aws_vpc_security_group_egress_rule" "outbound_rules" {
  security_group_id = aws_security_group.sg.id
  for_each          = var.sg_outbound_rules
  cidr_ipv4         = try(each.value.cidr_ipv4, null)
  cidr_ipv6         = try(each.value.cidr_ipv6, null)
  from_port         = try(each.value.from_port, null)
  ip_protocol       = each.value.ip_protocol
  to_port           = try(each.value.to_port, null)
}
