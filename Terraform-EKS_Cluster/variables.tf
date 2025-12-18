variable "project_name" {
  default = "safety"
}

variable "environment" {
  default = "dev"
}

variable "zone_id" {
  default = "Z05202297D7QR4S9L2JB"
}

variable "domain_name" {
  default = "naginenihariaws.store"
}

## EKS Cluster related variables

variable "eks_version" {

}

variable "eks_nodegroup_blue_version" {

}

variable "eks_nodegroup_green_version" {

}

variable enable_blue {

}

variable enable_green {
    
}