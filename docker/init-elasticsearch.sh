#!/bin/bash

# Elasticsearch가 준비될 때까지 대기
until curl -s http://elasticsearch:9200 > /dev/null; do
  echo "Waiting for Elasticsearch..."
  sleep 5
done

echo "Elasticsearch is up. Applying index templates and ILM policies..."

# 인덱스 템플릿 설정
curl -X PUT "http://elasticsearch:9200/_template/backend_logs_template" -H 'Content-Type: application/json' -d'
{
  "index_patterns": ["backend-logs-*"],
  "settings": {
    "number_of_shards": 1,
    "index.lifecycle.name": "backend_logs_policy",
    "index.lifecycle.rollover_alias": "backend-logs"
  },
  "mappings": {
    "properties": {
      "@timestamp": { "type": "date" },
      "level": { "type": "keyword" },
      "message": { "type": "text" },
      "logger": { "type": "keyword" },
      "thread": { "type": "keyword" },
      "service": { "type": "keyword" }
    }
  }
}
'

# ILM 정책 설정
curl -X PUT "http://elasticsearch:9200/_ilm/policy/backend_logs_policy" -H 'Content-Type: application/json' -d'
{
  "policy": {
    "phases": {
      "hot": {
        "actions": {
          "rollover": {
            "max_age": "7d",
            "max_size": "50gb"
          }
        }
      },
      "delete": {
        "min_age": "30d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
'

# 스냅샷 저장소 설정
curl -X PUT "http://elasticsearch:9200/_snapshot/my_backup" -H 'Content-Type: application/json' -d'
{
  "type": "fs",
  "settings": {
    "location": "/usr/share/elasticsearch/backup",
    "compress": true
  }
}
'

# 스냅샷 생성
curl -X PUT "http://elasticsearch:9200/_snapshot/my_backup/snapshot_1?wait_for_completion=true" -H 'Content-Type: application/json' -d'
{
  "indices": "backend-logs-*,ai-logs-*",
  "ignore_unavailable": true,
  "include_global_state": false
}
'

echo "Elasticsearch index management and snapshot settings applied."
