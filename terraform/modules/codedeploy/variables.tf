variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "listener_arn" {
  description = "The ARN of the ALB listener"
  type        = string
}

variable "blue_tg_name" {
  description = "The name of the blue target group"
  type        = string
}

variable "green_tg_name" {
  description = "The name of the green target group"
  type        = string
}

variable "deployment_group_name" {
  description = "The name of the CodeDeploy deployment group"
  type        = string
}

variable "code_deploy_role_arn" {
  description = "The ARN of the IAM role for CodeDeploy"
  type        = string
}

