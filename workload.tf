module "workload_foo" {
  source = "git::https://github.com/btower-labz/terraform-aws-btlabz-arch-ref-ec2-workload-module.git?ref=master"
  # source = "../../modules/workload-ec2"
  subnets = [
    module.vpc.private_a,
    module.vpc.private_b
  ]
  workload_ingress_sgs = [module.balancer.balancer_sg]
  zone_id              = module.subzone.zone_id
  lb_listener_arn      = module.balancer.http_listener_arn
  hostnames = [
    format("foo.%s", data.aws_route53_zone.subzone.name)
  ]
  tags = merge(
    map(
      "Workload", "workload-foo"
    ),
    var.tags
  )
}

module "workload_bar" {
  source = "git::https://github.com/btower-labz/terraform-aws-btlabz-arch-ref-ec2-workload-module.git?ref=master"
  # source = "../../modules/workload-ec2"
  subnets = [
    module.vpc.private_a,
    module.vpc.private_b
  ]
  workload_ingress_sgs = [module.balancer.balancer_sg]
  zone_id              = module.subzone.zone_id
  lb_listener_arn      = module.balancer.https_listener_arn
  hostnames = [
    format("bar.%s", data.aws_route53_zone.subzone.name)
  ]
  tags = merge(
    map(
      "Workload", "workload-bar"
    ),
    var.tags
  )
}
