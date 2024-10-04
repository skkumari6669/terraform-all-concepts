variable "instances" {
   type = map
   default = {
    mysql = "t3.small"
    backend = "t3.micro"
    frontend = "t3.micro"
   }
}

variable "hosted_zone_id" {
    default = "Z080246022VY26YENWR20"
}

variable "domain_name" {
    default = "devops81s.online"
}

variable "record_type" {
    default = "A"
}

variable "time_to_live" {
    default = 1
}