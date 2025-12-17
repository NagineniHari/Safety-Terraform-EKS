##---MongoDB SG Rules---##
# mongodb accepting traffic from  bastion on port 22
resource "aws_security_group_rule" "mongodb_bastion" {
  type                     = "ingress"
  security_group_id        = local.mongodb_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
##---Redis DB SG Rules---##
# redis accepting traffic from  bastion on port number 22
resource "aws_security_group_rule" "redis_bastion" {
  type                     = "ingress"
  security_group_id        = local.redis_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
##---Mysql DB SG Rules---##
# mysql accepting traffic from bastion on port number 22
resource "aws_security_group_rule" "mysql_bastion" {
  type                     = "ingress"
  security_group_id        = local.mysql_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
##---RabbitMQ DB SG Rules---##
# rabbitmq accepting traffic from bastion on port number 22
resource "aws_security_group_rule" "rabbitmq_bastion" {
  type                     = "ingress"
  security_group_id        = local.rabbitmq_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
##---EKS Controlplane SG Rules---##
# eks controlplane accepting traffic from bastion on port number 443 and Allow bastion host to access EKS control plane over HTTPS
resource "aws_security_group_rule" "eks_control_plane_bastion" {
  type                     = "ingress"
  security_group_id        = local.eks_control_plane_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 443
  protocol                 = "tcp"
  to_port                  = 443
}
##---EKS Managed node SG Rules---##
# eks managed node accepting traffic from bastion on port number 22
resource "aws_security_group_rule" "eks_node_bastion" {
  type                     = "ingress"
  security_group_id        = local.eks_node_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
# eks managed node accepting traffic from eks control plane from all port and all protocols
resource "aws_security_group_rule" "eks_node_eks_control_plane" {
  type                     = "ingress"
  security_group_id        = local.eks_node_sg_id
  source_security_group_id = local.eks_control_plane_sg_id
  from_port                = 0
  protocol                 = "-1"
  to_port                  = 0
}

# EKS control plane accepting traffic from eks node rom all port and all protocols
resource "aws_security_group_rule" "eks_control_plane_eks_node" {
  type                     = "ingress"
  security_group_id        = local.eks_control_plane_sg_id
  source_security_group_id = local.eks_node_sg_id
  from_port                = 0
  protocol                 = "-1"
  to_port                  = 0
}

# EKS nodes accepting traffic from VPC,This is manadatory for pod to pod communication because pods can be in any node in VPC CIDR
resource "aws_security_group_rule" "eks_node_vpc" {
  type                     = "ingress"
  security_group_id        = local.eks_node_sg_id
  cidr_blocks  = ["10.0.0.0/16"]
  from_port                = 0
  protocol                 = "-1"
  to_port                  = 0
}

# Ingress alb accepting traffic from public on port number 443
resource "aws_security_group_rule" "ingress_alb_public" {
  type              = "ingress"
  security_group_id = local.ingress_alb_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}

##### Bastion SG RUles #####
# bastion accepting traffic from my laptop
resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  security_group_id = local.bastion_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

##### OpenVPN SG RUles #####
#Open VPN accepting traffic from my laptop
resource "aws_security_group_rule" "open_vpn_public" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

# OpenVPN accepting traffic from port number 943
resource "aws_security_group_rule" "open_vpn_943" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 943
  protocol          = "tcp"
  to_port           = 943
}

# OpenVPN accepting traffic from port number 443
resource "aws_security_group_rule" "open_vpn_443" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}

# bastion accepting traffic from port number 1193
resource "aws_security_group_rule" "open_vpn_1193" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 1193
  protocol          = "tcp"
  to_port           = 1193
}


