# Dockerfile
ARG SERVER_TYPE=backend
FROM ubuntu:latest AS base

# 공통 작업
WORKDIR /app

ENV SERVER_TYPE=${SERVER_TYPE}

# 변수 확인을 위한 디버그 출력
RUN echo "SERVER_TYPE is: ${SERVER_TYPE}"

#COPY ./config/${SERVER_TYPE}-config /app/config

# 서버별 의존성 설치
RUN if [ "$SERVER_TYPE" = "backend" ]; then \
      # Node.js 및 npm 설치
      curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
      apt-get install -y nodejs && \
      # JDK 17 설치
      apt-get install -y openjdk-17-jdk && \
      # 버전 확인
      node -v && npm -v && java -version; \
    elif [ "$SERVER_TYPE" = "ai" ]; then \
      # Python 3.10 설치
      apt-get update && \
      apt-get install -y python3.10 python3.10-venv python3.10-distutils && \
      # 버전 확인
      python3.10 --version; \
    elif [ "$SERVER_TYPE" = "cloud" ]; then \
          # SSH 서버 설치 및 클라우드(배스쳔 호스트) 설정
          apt-get update && \
          apt-get install -y openssh-server && \
          mkdir /var/run/sshd && \
          # 사용자 생성 및 SSH 설정
          useradd -m -s /bin/bash bastion_user && \
          echo "bastion_user:your_password" | chpasswd && \
          mkdir -p /home/bastion_user/.ssh && \
          chmod 700 /home/bastion_user/.ssh && \
          # SSH 포트 노출
          EXPOSE 22; \
    fi


CMD ["sh", "-c", "echo Running $SERVER_TYPE server"]
