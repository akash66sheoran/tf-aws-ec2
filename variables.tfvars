vpc_id = "vpc-06e03ceca3fdca94d"

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
    subnet_id = "subnet-0b04b046fd7f57013"
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
    subnet_id = "subnet-019127a250d7bba4d"
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

managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore", "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]

inline_policies = {
  s3_policy = {
      Version = "2012-10-17"
      Statement = [{
        Effect   = "Allow"
        Action   = ["s3:ListBucket", "s3:GetObject"]
        Resource = ["*"]
      }]
    },
    ec2_policy = {
      Version = "2012-10-17"
      Statement = [{
        Effect   = "Allow"
        Action   = ["ec2:DescribeInstances", "ec2:DescribeVolumes"]
        Resource = ["*"]
      }]
    }
}