#!/bin/bash
# Regenerates ~/.kube/config live instead of committing real cluster data.
#
# Usage: run directly, or via install.sh / pkg_up. Requires:
#   aws sso login --profile Rosterfy-Developer-Access-<account-id>

set -euo pipefail

echo "Refreshing Rosterfy EKS kubeconfig entries..."

aws eks update-kubeconfig --name rosterfy-testing --region ap-southeast-2 --profile Rosterfy-Developer-Access-862465788762 --alias r2-qa-au
aws eks update-kubeconfig --name rosterfy-prod --region ap-southeast-2 --profile Rosterfy-Developer-Access-737915179106 --alias r2-prd-au
aws eks update-kubeconfig --name rosterfy --region us-east-2 --profile Rosterfy-Developer-Access-737915179106 --alias r2-prod-us
aws eks update-kubeconfig --name rosterfy-prod --region eu-west-3 --profile Rosterfy-Developer-Access-737915179106 --alias r2-prd-eu
aws eks update-kubeconfig --name rosterfy --region eu-west-2 --profile Rosterfy-Developer-Access-737915179106 --alias r2-prd-uk
aws eks update-kubeconfig --name rosterfy2 --region ca-central-1 --profile Rosterfy-Developer-Access-737915179106 --alias r2-prd-ca
aws eks update-kubeconfig --name rosterfy2-uat --region eu-west-3 --profile Rosterfy-Developer-Access-533267107697 --alias r2-uat-eu
aws eks update-kubeconfig --name rosterfy-prod --region eu-central-1 --profile Rosterfy-Developer-Access-997459304647 --alias r2-prod-ff
aws eks update-kubeconfig --name rosterfy-uat --region eu-central-1 --profile Rosterfy-Developer-Access-997459304647 --alias r2-uat-ff
aws eks update-kubeconfig --name rosterfy --region eu-central-1 --profile Rosterfy-Developer-Access-088382618622 --alias r2-prod-uefa

# Restore the default context regardless of call order above.
kubectl config use-context r2-qa-au

echo "Rosterfy EKS kubeconfig refreshed."
