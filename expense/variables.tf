variable "instance_names" {
    type = list(string)
    default = [ "mysql","backend","frontend" ]
}

variable "common_tags" {
    type = map
    default = {
    project = "expense"
    environment = "dev" 
    terraform = "true"
    }
}

variable "hosted_zone_id" {
    default = "Z080246022VY26YENWR20"
}

variable "domain_name" {
    default = "devops81s.online"
}