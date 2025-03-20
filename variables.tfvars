vpc_id = "vpc-00630eb309cc3939f"

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
    subnet_id = "subnet-03a9b5e35d8553b17"
    root_block_device = {
      volume_size = 10
      volume_type = "gp2"
    }
    ebs_block_device = [{
      device_name = "/dev/xvdb"
      volume_size = 10
      volume_type = "gp2"
  }]
  }
  server2 = {
    ami = "ami-08b5b3a93ed654d19"
    instance_type = "t2.micro"
    key_name = "linux-general"
    subnet_id = "subnet-0ad63d2539665045d"
    root_block_device = {
      volume_size = 10
      volume_type = "gp2"
    }
    ebs_block_device = [{
      device_name = "/dev/xvdb"
      volume_size = 10
      volume_type = "gp2"
    },
    {
      device_name = "/dev/xvdc"
      volume_size = 10
      volume_type = "gp2"
    }]
  }
}