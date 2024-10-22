#!/bin/bash

terraform apply -auto-approve -var-file="main.tfvars"
terraform output -json > terraform_output.json

public_ip=$(jq -r '.["ktb-cruming-public-instance"].value.ip[0]' terraform_output.json)
private_ip=$(jq -r '.["ktb-cruming-private-instance"].value.ip[0]' terraform_output.json)

echo "Public IP: $public_ip"
echo "Private IP: $private_ip"

cd ../ansible-C

if [ $? -ne 0 ]; then
  echo "Error: ../ansible 디렉토리를 찾을 수 없습니다."
  exit 1
fi

cat <<EOF > hosts.ini
[frontend]
$public_ip

[backend]
$private_ip ansible_user=ubuntu ansible_ssh_private_key_file=~/My/ktb/project/cruming/ktb-cruming-key.pem ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -i ~/My/ktb/project/cruming/ktb-cruming-key.pem ubuntu@$public_ip"'
EOF

echo "hosts.ini 파일이 ../ansible 디렉토리에 생성되었습니다."