import re
from flask import Blueprint, request, jsonify
from flask_jwt_extended import create_access_token, jwt_required, get_jwt_identity
from models import db, User

auth_bp = Blueprint('auth', __name__, url_prefix='/api/auth')

EMAIL_REGEX = r'^[\w\.-]+@[\w\.-]+\.\w+$'

@auth_bp.route('/signup', methods=['POST'])
def signup():
    data = request.get_json() or {}
    username = data.get('username', '').strip()
    email = data.get('email', '').strip().lower()
    password = data.get('password', '').strip()

    if not username or not email or not password:
        return jsonify({'error': '모든 필드(아이디, 이메일, 비밀번호)를 입력해주세요.'}), 400

    if len(username) < 3 or len(username) > 30:
        return jsonify({'error': '아이디는 3~30자 이내여야 합니다.'}), 400

    if not re.match(EMAIL_REGEX, email):
        return jsonify({'error': '올바른 이메일 형식이 아닙니다.'}), 400

    if len(password) < 6:
        return jsonify({'error': '비밀번호는 최소 6자 이상이어야 합니다.'}), 400

    if User.query.filter_by(username=username).first():
        return jsonify({'error': '이미 존재하는 아이디입니다.'}), 409

    if User.query.filter_by(email=email).first():
        return jsonify({'error': '이미 등록된 이메일입니다.'}), 409

    user = User(username=username, email=email)
    user.set_password(password)
    db.session.add(user)
    db.session.commit()

    access_token = create_access_token(
        identity=str(user.id),
        additional_claims={'username': user.username}
    )

    return jsonify({
        'message': '회원가입이 완료되었습니다.',
        'access_token': access_token,
        'user': user.to_dict()
    }), 201


@auth_bp.route('/login', methods=['POST'])
def login():
    data = request.get_json() or {}
    username = data.get('username', '').strip()
    password = data.get('password', '').strip()

    if not username or not password:
        return jsonify({'error': '아이디와 비밀번호를 입력해주세요.'}), 400

    user = User.query.filter(
        (User.username == username) | (User.email == username.lower())
    ).first()

    if not user or not user.check_password(password):
        return jsonify({'error': '아이디 또는 비밀번호가 일치하지 않습니다.'}), 401

    access_token = create_access_token(
        identity=str(user.id),
        additional_claims={'username': user.username}
    )

    return jsonify({
        'message': '로그인 성공',
        'access_token': access_token,
        'user': user.to_dict()
    }), 200


@auth_bp.route('/me', methods=['GET'])
@jwt_required()
def get_current_user():
    user_id = int(get_jwt_identity())
    user = User.query.get(user_id)
    if not user:
        return jsonify({'error': '사용자를 찾을 수 없습니다.'}), 404

    return jsonify({'user': user.to_dict()}), 200
