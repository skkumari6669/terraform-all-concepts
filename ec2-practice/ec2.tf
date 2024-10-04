resource "aws_instance" "instance_info" {
  count = length(var.instance_names)
  ami = data.aws_ami.ami_info.id
  # instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  instance_type = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [ aws_security_group.sg_id.id ]
  tags = merge(
    var.common_tags,
    {
      Name = var.instance_names[count.index]
    }
  )  
}
resource "aws_security_group" "sg_id" {
     
    name = var.sg_name
    ingress {

        from_port = var.from_port
        to_port = var.to_port
        protocol = var.protocol
        cidr_blocks      = var.ingress_cidr
        ipv6_cidr_blocks = var.ingress_ipv4
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = var.egress_protocal
        cidr_blocks      = var.egress_cidr
        ipv6_cidr_blocks = var.egress_ipv4
    }

    tags = merge(
      var.common_tags,
      {
       Name = "allow_ssh_practice_tags"
      }
    )
}



