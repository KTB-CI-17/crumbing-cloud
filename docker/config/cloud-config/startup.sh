#!/bin/bash
echo "Starting Cloud Server (Bastion Host) setup..."

# 환경 변수 대체 후 ssh_config 파일 설정
envsubst < /app/config/cloud-config/ssh_config > /etc/ssh/sshd_config

# bastion_user 계정 생성 및 비밀번호 설정
useradd -m -s /bin/bash "$BASTION_USER"
echo "$BASTION_USER:$BASTION_PASSWORD" | chpasswd

# SSH 서비스 시작
service ssh start

echo "Cloud Server setup complete. SSH is running on port ${SSH_PORT}."
