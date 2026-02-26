resource "aws_ecs_service" "app_service" {
  name            = "aman-app-service"
  cluster         = aws_ecs_cluster.app_cluster.id
  task_definition = aws_ecs_task_definition.app_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  network_configuration {
    subnets          = [var.private_subnet_1, var.private_subnet_2]
    security_groups  = [var.ecs_sg_id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.blue_target_group_arn
    container_name   = "aman-strapi-container"
    container_port   = 1337
  }

  lifecycle {
    ignore_changes = [task_definition]
  }

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

}