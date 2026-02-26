variable "private_subnet_1" {}
variable "private_subnet_2" {}
variable "ecs_sg_id" {}
variable "blue_target_group_arn" {
  type = string
}
variable "db_address" {}
variable "db_port" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}

variable "app_image" {}
variable "aws_region" {}
variable "jwt_secret" {}
variable "app_keys" {}
variable "api_token_salt" {}
variable "admin_jwt_secret" {}

variable "execution_role_arn" {
  type = string
}