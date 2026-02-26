output "cluster_name" { value = aws_ecs_cluster.app_cluster.name }
output "service_name" { value = aws_ecs_service.app_service.name }