vpc_id = "vpc-0a161cc6ccb2f5134"

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

instances = {
  server1 = {
    ami = "ami-08b5b3a93ed654d19"
    instance_type = "t2.micro"
    key_name = "linux-general"
    subnet_id = "subnet-05350bc83792c4c0b"
    root_block_device = {
      volume_size = 10
      volume_type = "gp2"
    }
    ebs_block_device = {
      device_name = "/dev/xvdb"
      volume_size = 10
      volume_type = "gp2"
  }
  }
  server2 = {
    ami = "ami-08b5b3a93ed654d19"
    instance_type = "t2.micro"
    key_name = "linux-general"
    subnet_id = "subnet-08405213b795b5c3f"
    root_block_device = {
      volume_size = 10
      volume_type = "gp2"
    }
    ebs_block_device = {
      device_name = "/dev/xvdb"
      volume_size = 10
      volume_type = "gp2"
    }
  }
}