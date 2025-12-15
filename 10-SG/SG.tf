module "sg" {
  count          = length(var.sg_names)
  source         = "git::https://github.com/naginenihari/Terraform-Module-SG.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = var.sg_names[count.index]
  sg_description = "created for ${var.sg_names[count.index]} services"
  vpc_id         = local.vpc_id
}
