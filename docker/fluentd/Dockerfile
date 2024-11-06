FROM fluent/fluentd:v1.16.3-debian-1.0

USER root

# 필수 패키지 설치 (네트워크 문제 시 필요)
RUN apt-get update && apt-get install -y build-essential

# fluent-plugin-elasticsearch 플러그인 설치
RUN gem install fluent-plugin-elasticsearch

USER fluent
