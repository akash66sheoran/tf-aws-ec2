variable "sg_inbound_rules" {
  type = map(object({
    source = string
    from_port = number
    to_port = number
    ip_protocol = string
  }))
}

variable "sg_name" {
  type = string
  default = "my-sg"
}

variable "vpc_id" {
  type = string
  default = ""
}

variable "instances" {
  type = map(object({
    ami = string
    instance_type = string
    key_name = string
    subnet_id = string
    root_block_device = object({
      volume_size = number
      volume_type = string
    })
    ebs_block_device = list(object({
      device_name = string
      volume_size = number
      volume_type = string
    }))
  }))
}

variable "iam_instance_profile" {
  type = string
  default = "my-instance-profile"
}

variable "ec2_role_name" {
  type = string
  default = "ec2-role"
}

variable "managed_policy_arns" {
  type        = list(string)
  default     = []
}

variable "inline_policies" {
  description = "Map of inline policies to attach to the role. Each policy is defined as an object."
  type = map(object({
    Version   = string
    Statement = list(object({
      Effect   = string
      Action   = list(string)
      Resource = list(string)
    }))
  }))
  default = {}
}