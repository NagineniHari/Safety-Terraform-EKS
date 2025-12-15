data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
}

data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project_name}/${var.environment}/bastion/sg_id"
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project_name}/${var.environment}/mongodb/sg_id"
}

data "aws_ssm_parameter" "redis_sg_id" {
  name = "/${var.project_name}/${var.environment}/redis/sg_id"
}

data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name = "/${var.project_name}/${var.environment}/rabbitmq/sg_id"
}

data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.project_name}/${var.environment}/mysql/sg_id"
}

data "aws_ssm_parameter" "ingress_alb_sg_id" {
  name = "/${var.project_name}/${var.environment}/ingress_alb/sg_id"
}

data "aws_ssm_parameter" "eks_control_plane_sg_id" {
  name = "/${var.project_name}/${var.environment}/eks_control_plane/sg_id"
}
    
data "aws_ssm_parameter" "eks_node_sg_id" {
  name = "/${var.project_name}/${var.environment}/eks_node/sg_id"
}

data "aws_ssm_parameter" "open_vpn_sg_id" {
  name = "/${var.project_name}/${var.environment}/open_vpn/sg_id"
}