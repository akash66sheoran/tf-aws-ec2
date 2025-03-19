variable "ec2_name" {
  type = string
  default = ""
}

variable "ami" {
  type = string
  default = ""
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_pair" {
  type = string
  default = ""
}

variable "subnet_id" {
  type = string
  default = ""
}

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