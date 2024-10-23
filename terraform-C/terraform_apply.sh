#!/bin/bash

terraform init
terraform validate
terraform plan -var-file="main.tfvars" -out=planfile

if [ $? -ne 0 ]; then
  echo "Error: Terraform plan failed."
  exit 1
fi

terraform apply -auto-approve planfile
terraform output -json > terraform_output.json

temp_ip=$(jq -r '.["ktb_cruming_public_instance"].value.ip[0]' terraform_output.json)
back_ip=$(jq -r '.["ktb_cruming_private_instance"].value.ip[0]' terraform_output.json)
front_ip=$(jq -r '.["ktb_cruming_private_instance"].value.ip[1]' terraform_output.json)

echo "temp ip: $temp_ip"
echo "front ip: $front_ip"
echo "back ip: $back_ip"

cd ../ansible-C

if [ $? -ne 0 ]; then
  echo "Error: ../ansible 디렉토리를 찾을 수 없습니다."
  exit 1
fi

cat <<EOF > hosts.ini
[frontend]
$temp_ip
$front_ip ansible_user=ubuntu ansible_ssh_private_key_file=~/My/ktb/project/cruming/source/ktb-cruming-key.pem ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -i ~/My/ktb/project/cruming/source/ktb-cruming-key.pem ubuntu@$temp_ip"'

[backend]
$back_ip ansible_user=ubuntu ansible_ssh_private_key_file=~/My/ktb/project/cruming/source/ktb-cruming-key.pem ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -i ~/My/ktb/project/cruming/source/ktb-cruming-key.pem ubuntu@$temp_ip"'
EOF

echo "hosts.ini 파일이 ../ansible 디렉토리에 생성되었습니다."