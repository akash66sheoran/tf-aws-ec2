variable "sg_inbound_rules" {
  type = map(object({
    cidr_ipv4   = optional(string)
    cidr_ipv6   = optional(string)
    from_port   = number
    to_port     = number
    ip_protocol = string
  }))
  default = {}
}

variable "sg_outbound_rules" {
  type = map(object({
    cidr_ipv4   = optional(string)
    cidr_ipv6   = optional(string)
    from_port   = number
    to_port     = number
    ip_protocol = string
  }))
  default = {}
}

variable "sg_name" {
  type = string
  description = "Name of the security group"
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "instances" {
  type = map(object({
    ami                    = string
    instance_type          = string
    key_name               = string
    subnet_id              = string
    vpc_security_group_ids = optional(list(string), [])
    root_block_device = object({
      volume_size = number
      volume_type = string
    })
    ebs_block_device = optional(list(object({
      device_name = string
      volume_size = number
      volume_type = string
    })), [])
    tags = optional(map(string), {})
  }))
}

variable "already_existing_role" {
  description = "Name of the already existing role for ec2 (pass this value if you already have a role and don't want to create new)"
  type = string
  default = ""
}

variable "ec2_role_name" {
  description = "Name of the role to be created for ec2 (if the value of already_existing_role is not provided, then a new role will be created with this name)"
  type = string
  default = "my-role"
}

variable "managed_policy_arns" {
  description = "List of ARNs of the policies already present in the aws account"
  type    = list(string)
  default = []
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}
