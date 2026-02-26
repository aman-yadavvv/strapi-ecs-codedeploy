output "alb_dns_name" {
  value = aws_lb.strapi_alb.dns_name
}

output "alb_arn" {
  value = aws_lb.strapi_alb.arn
}

output "blue_tg_arn" {
  value = aws_lb_target_group.blue.arn
}

output "green_tg_arn" {
  value = aws_lb_target_group.green.arn
}

output "blue_tg_name" {
  value = aws_lb_target_group.blue.name
}

output "green_tg_name" {
  value = aws_lb_target_group.green.name
}

output "listener_arn" {
  value = aws_lb_listener.strapi_listener.arn
}