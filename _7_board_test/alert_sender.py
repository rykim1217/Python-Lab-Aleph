import os
import json
import requests
from dotenv import load_dotenv

# 프로젝트 상위 폴더의 .env 불러오기
load_dotenv("../.env")

# 설정값
N8N_WEBHOOK_URL = os.getenv("N8N_WEBHOOK_URL")
STUDENT = "김라연"

# 환경변수가 없으면 전송하지 않고 종료
if not N8N_WEBHOOK_URL:
    print("[오류] N8N_WEBHOOK_URL 환경변수가 설정되지 않았습니다.")
    raise SystemExit(1)

alerts = [
    {
        "ip": "1.2.3.4",
        "level": 10,
        "rule": "5712"
    },
    {
        "ip": "5.6.7.8",
        "level": 3,
        "rule": "1001"
    }
]

data = {
    "student": STUDENT,
    "alerts": alerts
}

# A2 증적용: 실제 전송할 JSON 확인
print("[전송 JSON]")
print(json.dumps(data, ensure_ascii=False, indent=2))

try:
    response = requests.post(
        N8N_WEBHOOK_URL,
        json=data,
        timeout=5
    )

    print(f"[n8n] 전송 완료 -> {response.status_code}")

except requests.RequestException as e:
    print(f"[오류] n8n 전송 실패: {e}")