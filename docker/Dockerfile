# 베이스 이미지 선택 (Python 3.10 슬림 버전)
FROM python:3.10-slim

# 작업 디렉토리 설정
WORKDIR /app

# 필요 패키지 설치
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# 애플리케이션 코드 복사
COPY . /app

# 포트 노출 (9090번 포트)
EXPOSE 9090

# 모니터링 도구 설치 (필요한 경우)
# 예: Prometheus Node Exporter 설치
# RUN apt-get update && \
#     apt-get install -y prometheus-node-exporter && \
#     apt-get clean

# 애플리케이션 실행
CMD ["python", "app.py"]
