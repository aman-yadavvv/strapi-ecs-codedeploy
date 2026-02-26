variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "my-vpc"
}

variable "jwt_secret" {
  description = "The JWT secret for the application."
  default     = "e8AQzTx6B21mWAhgfao03cDSNowwuWccI3yBeOhI0vQ="
  type        = string
  sensitive   = true
}

variable "app_keys" {
  default = "jSt4uscfYI7mb1G72tSoMRoEsZ9zb6MSVGcRKPmfbMA=,CAXDY8YxCi1QSy/xOLEVbhBQpIcXX21Q++B6nDG4Y58=,nqZHSQqg1QuGtIh51gUxZOwsQZvaI/9JPMIixveL55A=,Iqvzx+wbFLynp/AGqnau3t0cSf/jiynITqCyyS6oqgk="
}

variable "api_token_salt" {
  default = "s9MXVOpCGMDdRWwQei/Etgf0uE8aLReoR/+AE8plQiWk="
}

variable "admin_jwt_secret" {
  default = "g0CK0CkzuFk6I0DZQCHH/wSKjksmP17MFbw3qfEJwfw="
}

variable "db_password" {
  description = "The password for the RDS database."
  type        = string
  default     = "mysecretpassword"
  sensitive   = true
}

variable "app_image" {
  description = "The Docker image for the application."
  type        = string
  default     = "811738710312.dkr.ecr.us-east-1.amazonaws.com/aman-app:ef0dbd7561f9fc3d87c256a3079af801c639dbcb"
}

variable "execution_role_arn" {
  description = "The ARN of the IAM role for ECS task execution."
  type        = string
  default     = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"

}

variable "code_deploy_role_arn" {
  description = "The ARN of the IAM role for CodeDeploy"
  type        = string
  default     = "arn:aws:iam::811738710312:role/codedeploy_role"
}
