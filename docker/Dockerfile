# Dockerfile
ARG SERVER_TYPE
FROM ./Dockerfile.base AS base

# 공통 작업
WORKDIR /app
COPY config/${SERVER_TYPE}-config /app/config

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
    fi

CMD ["sh", "-c", "echo Running $SERVER_TYPE server"]
