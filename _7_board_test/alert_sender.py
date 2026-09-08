import os
import json
import requests
from pathlib import Path
from dotenv import load_dotenv

# alert_sender.py 위치를 기준으로 상위 폴더의 .env 불러오기
BASE_DIR = Path(__file__).resolve().parent
load_dotenv(BASE_DIR.parent / ".env")

N8N_WEBHOOK_URL = os.getenv("N8N_WEBHOOK_URL")
STUDENT = "김라연"

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