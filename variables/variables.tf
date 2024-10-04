
variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "This var is devops practice ami id" 
}

variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "instance type is t2 micro"
  
}

variable "tags" {
    type = map
    default = {
        Name = "backend"
        Project = "expense"
        Component = "backend"
        Environment = "DEV"
        Terraform = "true"
    }
}

variable "sg_name" {
    type = string
    default = "allow_ssh"
}

variable "sg_description" {
    type = string
    default = "description for security groups" 
}

variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}

variable "protocal" {
    type = string
    default = "tcp"
}

variable "ingress_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
  
}