output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_arn" {
  value = module.alb.alb_arn
}

output "blue_target_group_arn" {
  value = module.alb.blue_tg_arn
}

output "green_target_group_arn" {
  value = module.alb.green_tg_arn
}

output "ecs_service_name" {
  value = module.ecs.service_name
}

output "application_url" {
  value = "http://${module.alb.alb_dns_name}"
}
