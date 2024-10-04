# output "public_ip" {
#   value = aws_instance.instance_info.public_ip
#   description = "This is public ip"
# }

# output "private_ip" {
#     value = aws_instance.instance_info.private_ip
#     description = "this is private ip"
# }

output "instances_information" {
    value = aws_instance.instance_info
}

output "ami_id" {
    value = data.aws_ami.ami_info.id
}