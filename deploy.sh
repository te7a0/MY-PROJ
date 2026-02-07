#!/bin/bash

set -e

ROOT="/mnt/f/my-project"
TF_DIR="$ROOT/iac"
ANSIBLE_DIR="$ROOT/ansible_conf"

echo "===== Terraform Init & Apply ====="

cd $TF_DIR
terraform init
terraform apply -auto-approve

echo "===== Export Terraform Outputs ====="

terraform output -json > terraform_outputs.json

echo "===== Move Outputs To Ansible ====="

mv terraform_outputs.json $ANSIBLE_DIR/

echo "===== Run Ansible ====="

cd $ANSIBLE_DIR
ansible-playbook playbook.yml

echo "===== ALL DONE ====="
