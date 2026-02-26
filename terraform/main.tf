data "aws_vpc" "default" {
  default = true
}

# Get Default Subnets
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}




module "security" {
  source = "./modules/security"
  vpc_id = data.aws_vpc.default.id
}

module "alb" {
  source          = "./modules/alb"
  vpc_id          = data.aws_vpc.default.id
  alb_sg_id       = module.security.alb_sg_id
  public_subnet_1 = data.aws_subnets.default.ids[0]
  public_subnet_2 = data.aws_subnets.default.ids[1]
}

module "rds" {
  source           = "./modules/rds"
  private_subnet_1 = data.aws_subnets.default.ids[0]
  private_subnet_2 = data.aws_subnets.default.ids[1]
  rds_sg_id        = module.security.rds_sg_id
  db_password      = var.db_password
}

module "ecs" {
  source                = "./modules/ecs"
  private_subnet_1      = data.aws_subnets.default.ids[0]
  private_subnet_2      = data.aws_subnets.default.ids[1]
  ecs_sg_id             = module.security.ecs_sg_id
  blue_target_group_arn = module.alb.blue_tg_arn
  execution_role_arn    = var.execution_role_arn


  db_address  = module.rds.db_address
  db_port     = module.rds.db_port
  db_name     = module.rds.db_name
  db_username = module.rds.db_username
  db_password = var.db_password

  app_image        = var.app_image
  aws_region       = var.aws_region
  jwt_secret       = var.jwt_secret
  app_keys         = var.app_keys
  api_token_salt   = var.api_token_salt
  admin_jwt_secret = var.admin_jwt_secret
}


  module "codedeploy" {
  source = "./modules/codedeploy"

  ecs_cluster_name = module.ecs.cluster_name
  ecs_service_name = module.ecs.service_name

  listener_arn          = module.alb.listener_arn
  blue_tg_name          = module.alb.blue_tg_name
  green_tg_name         = module.alb.green_tg_name
  deployment_group_name = "strapi-deployment-group"
  code_deploy_role_arn  = var.code_deploy_role_arn
 }