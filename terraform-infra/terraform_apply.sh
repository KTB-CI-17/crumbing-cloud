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

bastion_ip=$(jq -r '.["ktb_cruming_public_instance"].value.bastion' terraform_output.json)
master_ip=$(jq -r '.["ktb_cruming_private_instance"].value.master' terraform_output.json)
worker1_ip=$(jq -r '.["ktb_cruming_private_instance"].value["worker-1"]' terraform_output.json)
worker2_ip=$(jq -r '.["ktb_cruming_private_instance"].value["worker-2"]' terraform_output.json)
worker_ai_ip=$(jq -r '.["ktb_cruming_private_instance"].value["worker-ai"]' terraform_output.json)

echo "bastion ip: $bastion_ip"
echo "master ip: $master_ip"
echo "worker1 ip: $worker1_ip"
echo "worker2 ip: $worker2_ip"
echo "worker-ai ip: $worker_ai_ip"

cd ../ansible

if [ $? -ne 0 ]; then
  echo "Error: ../ansible 디렉토리를 찾을 수 없습니다."
  exit 1
fi

cat <<EOF > hosts.ini
[public]
$bastion_ip

[master]
$master_ip ansible_user=ubuntu ansible_ssh_private_key_file=~/ktb-cruming-key.pem ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -i ~/ktb-cruming-key.pem ubuntu@$bastion_ip"'

[worker]
EOF

for ip in "$worker1_ip" "$worker2_ip" "$worker_ai_ip"; do
   if [ "$ip" != "null" ] && [ ! -z "$ip" ]; then
       echo "$ip ansible_user=ubuntu ansible_ssh_private_key_file=~/ktb-cruming-key.pem ansible_ssh_common_args='-o ProxyCommand=\"ssh -W %h:%p -i ~/ktb-cruming-key.pem ubuntu@$bastion_ip\"'" >> hosts.ini
   fi
done

cat hosts.ini

echo "hosts.ini 파일이 ../ansible 디렉토리에 생성되었습니다."