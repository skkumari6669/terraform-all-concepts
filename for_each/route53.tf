resource "aws_route53_record" "records_information" {
  for_each = aws_instance.aws_ec2_terraform
  zone_id = var.hosted_zone_id
  name    = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type    = var.record_type
  ttl     = var.time_to_live
  records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
}

 



