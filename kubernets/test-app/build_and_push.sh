#!/bin/bash

# 설정
DOCKER_USERNAME="choiseu98"
IMAGE_NAME="k8s-test-python-app"
TAG="latest"

# Docker Compose를 사용하여 빌드
echo "🔨 Building Docker image..."
docker-compose build

# 이미지 태깅
echo "🏷 Tagging Docker image..."
docker tag ${DOCKER_USERNAME}/${IMAGE_NAME}:latest ${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}

# Docker Hub로 푸시
echo "🚀 Pushing Docker image to Docker Hub..."
docker push ${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}

echo "✅ Build and push completed!"