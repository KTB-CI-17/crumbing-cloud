# cruming-cloud

### 커밋 메시지 컨벤션
***
한글로 작성. 기본 원칙 : 1 Action 1 Commit (최대한 작게 쪼개 한 커밋에 하나의 기능만 커밋되도록)

- feat: 새로운 기능 추가
- fix: 버그 수정
- docs: 문서 수정
- style: 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
- design: CSS, HTML 등 변경
- refactor: 코드 리팩토링
- test: 테스트 코드, 리팩토링 테스트 코드 추가
- chore: 빌드 업무 수정, 패키지 매니저 수정
- rename: 파일 혹은 폴더 명 변경만 진행된 경우
- remove: 파일 혹은 폴더 삭제 작업만 진행된 경우


### 테라폼 쉘 스크립트 사용법
***
해당 쉘 스크립트는 테라폼 생성 후 ansible - hosts.ini에 ip를 자동으로 할당하기 위해 만들어 졌습니다.

- brew install jq
- chmod +x terraform_apply.sh
- ./terraform_apply.sh


```yaml
**Firing**

Value: A=43.644769232962005, B=0
Labels:
  - alertname = worker-4 memory usage
  - grafana_folder = alert
Annotations:
  - summary = worker-ai : 메모리 60% 이상 사용중
Source: https://grafana.cruming.site/alerting/grafana/fe7rdx5vbg45cb/view?orgId=1
Silence: https://grafana.cruming.site/alerting/silence/new?alertmanager=grafana&matcher=alertname%3Dworker-ai+memory+usage&matcher=grafana_folder%3Dalert&orgId=1
Dashboard: https://grafana.cruming.site/d/JABGX_-mzz?orgId=1
Panel: https://grafana.cruming.site/d/JABGX_-mzz?orgId=1&viewPanel=4
```

