"""등급별 접근 제어 및 관리자 회원 관리."""
from flask import Blueprint, jsonify, request
from flask_jwt_extended import jwt_required, get_jwt_identity
from extensions import db
from models import User

access_bp = Blueprint('access', __name__, url_prefix='/api/access')
ROLE_NAMES = {0: '일반등급', 1: '골드등급', 2: '관리자'}

def get_current_user():
    return db.session.get(User, int(get_jwt_identity()))

def require_admin():
    user = get_current_user()
    if not user:
        return None, (jsonify({'msg': '사용자 정보를 찾을 수 없습니다.'}), 404)
    if user.role != 2:
        return None, (jsonify({'msg': f'접근 권한이 없습니다. 현재 등급: {ROLE_NAMES.get(user.role, "알 수 없음")}({user.role})'}), 403)
    return user, None

@access_bp.route('/gold', methods=['GET'])
@jwt_required()
def gold_access():
    user = get_current_user()
    if not user:
        return jsonify({'msg': '사용자 정보를 찾을 수 없습니다.'}), 404
    if user.role < 1:
        return jsonify({'msg': f'접근 권한이 없습니다. 현재 등급: 일반등급({user.role})'}), 403
    return jsonify({'msg': '접근 허용', 'username': user.username, 'role': user.role,
                    'role_name': ROLE_NAMES.get(user.role, '알 수 없음')}), 200

@access_bp.route('/admin', methods=['GET'])
@jwt_required()
def admin_access():
    user, error = require_admin()
    if error: return error
    return jsonify({'msg': '관리자 접근 허용', 'username': user.username,
                    'role': user.role, 'role_name': '관리자'}), 200

@access_bp.route('/users', methods=['GET'])
@jwt_required()
def get_users():
    admin, error = require_admin()
    if error: return error
    users = User.query.order_by(User.id.asc()).all()
    return jsonify({'users': [{'id': u.id, 'username': u.username, 'role': u.role,
                               'role_name': ROLE_NAMES.get(u.role, '알 수 없음')} for u in users]}), 200

@access_bp.route('/users/<int:user_id>/role', methods=['PUT'])
@jwt_required()
def change_user_role(user_id):
    admin, error = require_admin()
    if error: return error
    target = db.session.get(User, user_id)
    if not target: return jsonify({'msg': '회원을 찾을 수 없습니다.'}), 404
    if target.id == admin.id: return jsonify({'msg': '현재 로그인한 관리자 자신의 등급은 변경할 수 없습니다.'}), 400
    data = request.get_json(silent=True) or {}
    try: new_role = int(data.get('role'))
    except (TypeError, ValueError): return jsonify({'msg': '올바른 등급을 선택해주세요.'}), 400
    if new_role not in (0, 1, 2): return jsonify({'msg': '권한은 0, 1, 2 중 하나여야 합니다.'}), 400
    old_role = target.role
    target.role = new_role
    db.session.commit()
    return jsonify({'msg': f'{target.username} 회원의 등급을 {ROLE_NAMES[old_role]}({old_role}) → {ROLE_NAMES[new_role]}({new_role})로 변경했습니다.'}), 200

@access_bp.route('/users/<int:user_id>', methods=['DELETE'])
@jwt_required()
def delete_user(user_id):
    admin, error = require_admin()
    if error: return error
    target = db.session.get(User, user_id)
    if not target: return jsonify({'msg': '회원을 찾을 수 없습니다.'}), 404
    if target.id == admin.id: return jsonify({'msg': '현재 로그인한 관리자 계정은 삭제할 수 없습니다.'}), 400
    username = target.username
    db.session.delete(target)
    db.session.commit()
    return jsonify({'msg': f'{username} 회원을 삭제했습니다.'}), 200
