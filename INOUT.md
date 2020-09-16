# Terraform inputs and outputs.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| aws | ~> 3.5.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.5.0 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| parent\_zone\_id | Parent R53 zone to created additional subzones | `any` | n/a | yes |
| tags | Additional tags. E.g. environment, backup tags etc | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| subzone\_id | n/a |
| subzone\_name | n/a |
| subzone\_name\_servers | n/a |

