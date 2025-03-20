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