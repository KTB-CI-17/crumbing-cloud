FROM fluent/fluentd:v1.16.3-debian-1.0

USER root

# 필수 패키지 설치 (네트워크 문제 시 필요)
RUN apt-get update && apt-get install -y bash curl build-essential

# 기존 elasticsearch gem 제거
RUN gem uninstall elasticsearch --all --executables || true
RUN gem uninstall elasticsearch-api --all --executables || true
RUN gem uninstall elasticsearch-transport --all --executables || true

# Elasticsearch 7.x에 맞는 gem 설치
RUN gem install elasticsearch -v 7.17.0
RUN gem install elasticsearch-api -v 7.17.0
RUN gem install elasticsearch-transport -v 7.17.0

# fluent-plugin-elasticsearch 설치 (5.x 버전)
RUN gem install fluent-plugin-elasticsearch -v 5.4.3

# Fluentd 설정 파일 복사
COPY fluent.conf /fluentd/etc/

USER fluent
