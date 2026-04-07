resource aws_key_pair terra-key-pair {
    key_name="${var.env}-terraform-key-pair"
    public_key=file("terraform-key-pair.pub")

}

resource aws_default_vpc defaultvpc {

}

resource aws_security_group terra-sec-group {
    name="${var.env}-aws-security-group"
    vpc_id = aws_default_vpc.defaultvpc.id
    ingress {
        to_port = 22
        from_port = 22
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        to_port = 80
        from_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        to_port = 8080
        from_port = 8080
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        to_port = 0
        from_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

}
resource aws_instance terra-ec2 {
    for_each = tomap({
        ec2-terra-micro="t2.micro"
        
    })
    depends_on = [aws_key_pair.terra-key-pair, aws_security_group.terra-sec-group ]
    key_name = aws_key_pair.terra-key-pair.key_name
    security_groups = [aws_security_group.terra-sec-group.name]
    ami = var.ec2_ami
    instance_type = each.value

    root_block_device {
      volume_size= var.env == "prod" ? 20:var.ec2_volume_size
  volume_type=var.ec2_volume_type
    }
    tags = {
      Name=each.key
      Environment=var.env
    }

}



