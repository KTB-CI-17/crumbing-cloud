#!/bin/bash

terraform init
terraform validate
terraform plan -var-file="main.tfvars" -out=planfile

# plan 성공 여부
if [ $? -ne 0 ]; then
  echo "Error: Terraform plan failed."
  exit 1
fi

echo "Terraform plan successful. Plan saved to 'planfile'."