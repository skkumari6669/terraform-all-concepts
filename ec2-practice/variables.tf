# variable "ami_id" {
#     default = "ami-09c813fb71547fc4f"
# }

# variable "instance_type" {
#     default = "t3.micro"
# }

variable "common_tags" {

    default = { 
        Project = "expense"
        Environtment = "dev"
        Terraform = "true"
    }

}

variable "sg_name" {
    default = "allow_ssh_practice"
}

variable "protocol" {
  default = "tcp"
}

variable "from_port" {
  default = 22
}

variable "to_port" {
  default = 22
}

variable "ingress_cidr" {
  default = ["0.0.0.0/0"]
}

variable "ingress_ipv4" {
  default = ["::/0"]
}

variable "egress_cidr" {
  default = ["0.0.0.0/0"]
}

variable "egress_ipv4" {
  default = ["::/0"]
}

variable "egress_protocal" {
  default = "-1"
}

# =================Route 53 variables===============

variable "hosted_zone_id" {
    default = "Z080246022VY26YENWR20"
}

# variable "domain_name" {
#     default = "devops81s.online"
# }

variable "record_type" {
    default = "A"
}

variable "time_to_live" {
    default = 1
}
