# AWS EC2 Reference Architecture

## Main Terraform Layer

### Project structure

See here: [FILES](FILES.md)

### Inputs\Outputs

See here: [INPUTS\OUTPUTS](INOUT.md)

### Features

* VPC deployment
* Public and Private subnets
* Loadbalancer with Certificates
* Sample plain EC2 workload

### Usage

Do parent R53 zone configuration based on [private.auto.tfvars.sample](private.auto.tfvars.sample).

Configure terraform backend profile based on [backend.tf.sample](backend.tf.sample)

Configure AWS profile for the infrastructure (see [provider.tf](provider.tf))

Deploy using [deploy.sh](deploy.sh)

Update using [update.sh](update.sh)

Reset CodeDeploy application and clean revisions using [resetapp.sh](resetapp.sh)

```bash


```
