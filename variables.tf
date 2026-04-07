variable "ec2_volume_size" {
    default=12
    type = number
  
}
variable "ec2_volume_type" {
    default = "gp2"
    type = string
}

variable "ec2_instance_type"{
    default="t2.nano"
    type = string
}

variable "ec2_ami"{
    default="ami-0ecb62995f68bb549"
    type = string
}

variable "env"{
    default="xbskjbx"
    type=string 
}