output "public_ip" {
    value = aws_instance.aws_ec2_terraform.public_ip
    sensitive = false
    description = "public ip of created instance through terraform"
  
}