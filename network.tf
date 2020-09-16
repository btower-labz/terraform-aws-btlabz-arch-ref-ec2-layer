module "vpc" {
  source  = "btower-labz/btlabz-vpc-ha-2x/aws"
  version = "0.1.0"
  tags    = var.tags
}

data "aws_route53_zone" "parent" {
  zone_id = var.parent_zone_id
}

module "subzone" {
  source         = "git::https://github.com/btower-labz/terraform-aws-btlabz-arch-ref-ec2-subzone-module.git?ref=master"
  # source         = "../../modules/subzone"
  name           = "ec2"
  parent_zone_id = data.aws_route53_zone.parent.zone_id
  tags           = var.tags
}

data "aws_route53_zone" "subzone" {
  zone_id = module.subzone.zone_id
}
