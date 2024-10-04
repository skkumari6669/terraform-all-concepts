resource "aws_security_group" "allow_ssh_terraform" {
  name = "allow_ssh"
  description = "allow all traffic inbound and out bound"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }

}

resource "aws_instance" "aws_ec2_terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.allow_ssh_terraform.id ]
    tags = {
        Name = "terraform"
    }
    provisioner "local-exec" {
      command = "echo ${self.private_ip} > ipaddress.txt"
    }

    provisioner "remote-exec" {
      inline = [ 
        "sudo dnf install ansible -y",
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx",
       ]
    }

    provisioner "remote-exec" {
      when = destroy
      inline = [ 
        "sudo systemctl stop nginx",
       ]
    }
}

