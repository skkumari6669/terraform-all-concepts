resource "aws_route53_record" "records_information" {
  count = length(var.instance_names)
  zone_id = var.hosted_zone_id
  name    = var.instance_names[count.index] == "frontend" ? local.domain_name : "${var.instance_names[count.index]}.${local.domain_name}"
  type    = var.record_type
  ttl     = var.time_to_live
  records = var.instance_names[count.index] == "frontend" ? [aws_instance.instance_info[count.index].public_ip] : [aws_instance.instance_info[count.index].private_ip]
}

 



