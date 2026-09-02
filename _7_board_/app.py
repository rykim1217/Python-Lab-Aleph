from flask import Flask, render_template, jsonify
from flask_cors import CORS
from flask_jwt_extended import JWTManager
from config import Config
from models import db, Category, User, Post
from auth import auth_bp
from posts import posts_bp

def create_app(config_class=Config):
    app = Flask(__name__, template_folder='templates', static_folder='static')
    app.config.from_object(config_class)

    # Extension Initialization
    CORS(app)
    db.init_app(app)
    jwt = JWTManager(app)

    # JWT Error handlers
    @jwt.unauthorized_loader
    def unauthorized_response(callback):
        return jsonify({
            'error': '인증 토큰이 누락되었습니다. 로그인이 필요합니다.'
        }), 401

    @jwt.invalid_token_loader
    def invalid_token_response(callback):
        return jsonify({
            'error': '유효하지 않은 토큰입니다. 다시 로그인해주세요.'
        }), 401

    @jwt.expired_token_loader
    def expired_token_response(jwt_header, jwt_payload):
        return jsonify({
            'error': '토큰이 만료되었습니다. 다시 로그인해주세요.'
        }), 401

    # Register Blueprints
    app.register_blueprint(auth_bp)
    app.register_blueprint(posts_bp)

    # Web Page Route
    @app.route('/')
    def index():
        return render_template('index.html')

    # Seed Initial Categories & Tables helper
    @app.cli.command('init-db')
    def init_db():
        with app.app_context():
            db.create_all()
            default_categories = ['자유게시판', '질문과 답변', '정보 공유', '공지사항']
            for cat_name in default_categories:
                if not Category.query.filter_by(name=cat_name).first():
                    db.session.add(Category(name=cat_name, description=f'{cat_name} 카테고리'))
            db.session.commit()
            print("Database initialized and default categories seeded!")

    return app

app = create_app()

# Auto-create tables and default categories on startup if DB is connected
with app.app_context():
    try:
        db.create_all()
        default_categories = ['자유게시판', '질문과 답변', '정보 공유', '공지사항']
        for cat_name in default_categories:
            if not Category.query.filter_by(name=cat_name).first():
                db.session.add(Category(name=cat_name, description=f'{cat_name} 카테고리'))
        db.session.commit()
    except Exception as e:
        print(f"[Warning] Could not connect to DB or initialize tables automatically: {e}")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
