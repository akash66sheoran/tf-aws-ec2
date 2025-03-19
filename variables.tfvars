ec2_name = "server1"
ami = "ami-08b5b3a93ed654d19"
key_pair = "linux-general"
vpc_id = "vpc-0f0098385c2933cc3"
subnet_id = "subnet-0da7f6b51c6f70876"

sg_inbound_rules = {
  allow_ssh = {
      source   = "0.0.0.0/0"
      from_port   = 22
      ip_protocol = "tcp"
      to_port     = 22
  }
  allow_http = {
      source   = "0.0.0.0/0"
      from_port   = 80
      ip_protocol = "tcp"
      to_port     = 80
  }
}