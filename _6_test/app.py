import json
import csv
import io
import requests
import mysql.connector
from flask import Flask, jsonify, render_template_string, Response

app = Flask(__name__)

# MySQL 연결 설정 (admin / 123456 계정 사용 환경)
DB_CONFIG = {
    'host': 'localhost',
    'port': 3306,
    'user': 'root',     # 필요시 'admin'으로 변경 가능
    'password': '123456',
    'database': 'github_db'
}

def get_db_connection():
    return mysql.connector.connect(**DB_CONFIG)

# 1. GitHub API 호출 및 DB 저장
@app.route('/fetch-and-save', methods=['GET'])
def fetch_and_save():
    res = requests.get("https://api.github.com")
    data = res.json()
    
    conn = get_db_connection()
    cursor = conn.cursor()
    
    query = """
    INSERT INTO api_logs (current_user_url, authorizations_url, repository_url)
    VALUES (%s, %s, %s)
    """
    values = (
        data.get('current_user_url'),
        data.get('authorizations_url'),
        data.get('repository_url')
    )
    
    cursor.execute(query, values)
    conn.commit()
    cursor.close()
    conn.close()
    
    return jsonify({
        "status": "success", 
        "message": "데이터가 DB에 저장되었습니다!", 
        "inserted_data": data
    })

# 2. DB 데이터 웹 화면 조회 (/ 및 /view 둘 다 접속 가능)
@app.route('/', methods=['GET'])
@app.route('/view', methods=['GET'])
def index():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM api_logs ORDER BY id DESC")
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    html_template = """
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>GitHub API Logs</title>
    </head>
    <body style="font-family: Arial, sans-serif; margin: 40px;">
        <h2>저장된 GitHub API 응답 데이터</h2>
        <p style="margin-bottom: 20px;">
            <a href="/fetch-and-save" target="_blank" style="padding: 8px 12px; background: #007bff; color: white; text-decoration: none; border-radius: 4px;">[1] 새 데이터 수집하기</a> &nbsp;
            <a href="/export/json" style="padding: 8px 12px; background: #28a745; color: white; text-decoration: none; border-radius: 4px;">[2] JSON 파일 다운로드</a> &nbsp;
            <a href="/export/csv" style="padding: 8px 12px; background: #ffc107; color: black; text-decoration: none; border-radius: 4px;">[3] CSV 파일 다운로드</a>
        </p>
        <table border="1" cellpadding="10" cellspacing="0" style="border-collapse: collapse; width: 100%;">
            <tr style="background-color: #f2f2f2;">
                <th>ID</th>
                <th>Current User URL</th>
                <th>Authorizations URL</th>
                <th>Repository URL</th>
                <th>Created At</th>
            </tr>
            {% if rows %}
                {% for row in rows %}
                <tr>
                    <td style="text-align: center;">{{ row.id }}</td>
                    <td>{{ row.current_user_url }}</td>
                    <td>{{ row.authorizations_url }}</td>
                    <td>{{ row.repository_url }}</td>
                    <td style="text-align: center;">{{ row.created_at }}</td>
                </tr>
                {% endfor %}
            {% else %}
                <tr>
                    <td colspan="5" style="text-align: center; color: #888;">저장된 데이터가 없습니다. '[1] 새 데이터 수집하기'를 먼저 눌러주세요.</td>
                </tr>
            {% endif %}
        </table>
    </body>
    </html>
    """
    return render_template_string(html_template, rows=rows)

# 3. JSON 파일 출력 (다운로드)
@app.route('/export/json', methods=['GET'])
def export_json():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM api_logs")
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    for row in rows:
        row['created_at'] = str(row['created_at'])

    return Response(
        json.dumps(rows, indent=2, ensure_ascii=False),
        status=200,
        mimetype='application/json',
        headers={"Content-Disposition": "attachment;filename=github_api_logs.json"}
    )

# 4. CSV 파일 출력 (다운로드)
@app.route('/export/csv', methods=['GET'])
def export_csv():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM api_logs")
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    if not rows:
        return "데이터가 없습니다.", 400

    string_io = io.StringIO()
    writer = csv.DictWriter(string_io, fieldnames=rows[0].keys())
    writer.writeheader()
    writer.writerows(rows)

    return Response(
        string_io.getvalue(),
        status=200,
        mimetype='text/csv',
        headers={"Content-Disposition": "attachment;filename=github_api_logs.csv"}
    )

if __name__ == '__main__':
    app.run(debug=True, port=5000)