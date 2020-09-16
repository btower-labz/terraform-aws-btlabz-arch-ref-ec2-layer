#!/usr/bin/env bash

set -o nounset
set -o noclobber
set -o errexit
set -o pipefail

aws sts get-caller-identity --profile terraform-state
aws sts get-caller-identity --profile terraform-infra
terraform taint module.codedeploy.aws_codedeploy_app.main
terraform apply -parallelism=50 -auto-approve
