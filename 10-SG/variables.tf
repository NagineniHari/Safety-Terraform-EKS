variable "project_name" {
  default = "safety"
}

variable "environment" {
  default = "dev"
}

variable "sg_names" {
  default = [
    #Databases
    "mongodb", "redis", "mysql", "rabbitmq",
    #Bastion
    "bastion",
    #Ingress Applcation Loadbalancer
    "ingress_alb",
    #VPN SG
    "open_vpn",
    #EKS Master node SG
    "eks_control_plane",
    #EKS Managed node SG
    "eks_node"
  ]
}