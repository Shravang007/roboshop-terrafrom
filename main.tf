#module "instances" {
#  for_each  = var.components
#  source    = "git::https://github.com/Shravang007/tf-module-app.git"
#  component = each.key
#  env       = var.env
#  tags      = merge(each.value["tags"], var.tags)
#}
#
#

module "vpc" {
  source     = "git::https://github.com/Shravang007/tf-module-vpc.git"

  for_each   = var.vpc
  cidr_block = each.value["cidr_block"]
  subnets = each.value["subnets"]

  env        = var.env
  tags       = var.tags
  default_vpc_id = var.default_vpc_id
}

output "subnet_ids" {
  value = module.vpc
}

#module "app_server" {
#  source     = "git::https://github.com/Shravang007/tf-module-app.git"
#
#  subnet_id = each.value["subnets"]
#
#  env        = var.env
#  tags       = var.tags
#  component  = "test"
#
#}