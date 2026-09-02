# Flask RESTful Board (게시판 프로젝트)

Windows 11, Docker Desktop, MySQL 8.0, Flask 기반의 RESTful 게시판입니다.

---

## 🚀 빠른 시작 가이드 (PowerShell / Windows Terminal)

### 1. MySQL 컨테이너 실행 (Docker Desktop)
```powershell
cd D:\KRY\Python-Labs-Aleph\_7_borad_
docker compose up -d
```

### 2. 가상환경 생성 및 패키지 설치
```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

### 3. Flask 서버 실행
```powershell
python app.py
```
브라우저에서 `http://127.0.0.1:5000` 으로 접속합니다.

---

## 📡 RESTful API 명세서

### 1. 인증 (Authentication - JWT)
| Method | Endpoint | Description | Auth Required |
| :--- | :--- | :--- | :---: |
| `POST` | `/api/auth/signup` | 회원가입 (`username`, `email`, `password`) | ❌ |
| `POST` | `/api/auth/login` | 로그인 (`username`, `password`) $\rightarrow$ JWT 발급 | ❌ |
| `GET` | `/api/auth/me` | 현재 로그인 사용자 정보 | ✅ (Bearer Token) |

### 2. 카테고리 (Category)
| Method | Endpoint | Description | Auth Required |
| :--- | :--- | :--- | :---: |
| `GET` | `/api/categories` | 카테고리 전체 목록 조회 | ❌ |

### 3. 게시글 (Posts - CRUD, 커서 페이징, 검색 & 필터)
| Method | Endpoint | Query / Body | Auth Required |
| :--- | :--- | :--- | :---: |
| `GET` | `/api/posts` | `cursor` (이전 마지막 ID), `limit` (기본 10), `category_id`, `search`, `search_type` (all/title/content/author) | ❌ |
| `GET` | `/api/posts/<id>` | 단일 게시글 상세 조회 (조회수 1 증가) | ❌ |
| `POST` | `/api/posts` | `{"title": "...", "content": "...", "category_id": 1}` | ✅ (Bearer Token) |
| `PUT` | `/api/posts/<id>` | `{"title": "...", "content": "...", "category_id": 1}` (작성자 확인) | ✅ (Bearer Token) |
| `DELETE` | `/api/posts/<id>` | 게시글 삭제 (작성자 확인) | ✅ (Bearer Token) |

---

## 💡 커서 기반 페이징 동작 원리 (Cursor-based Pagination)
- **정렬 방식**: 최신순 (`id DESC`)
- **요청 파라미터**: 첫 조회 시 `cursor` 없이 호출 $\rightarrow$ 응답으로 받은 `next_cursor` 값(가장 마지막 게시글의 `id`)을 다음 요청 시 전달
- **SQL 쿼리**: `WHERE id < :cursor ORDER BY id DESC LIMIT :limit + 1`
- **장점**: 오프셋(`OFFSET`) 방식과 달리 데이터가 추가/삭제되어도 중복이나 누락이 없고, 대량 데이터에서도 빠른 인덱스 스캔 성능을 보장합니다.
