from flask import Blueprint, request, jsonify
from flask_jwt_extended import jwt_required, get_jwt_identity
from sqlalchemy import or_
from models import db, Post, User, Category

posts_bp = Blueprint('posts', __name__, url_prefix='/api')

@posts_bp.route('/categories', methods=['GET'])
def get_categories():
    categories = Category.query.order_by(Category.id.asc()).all()
    return jsonify({'categories': [c.to_dict() for c in categories]}), 200


@posts_bp.route('/posts', methods=['GET'])
def get_posts():
    """
    게시글 목록 조회 (커서 기반 페이징, 검색, 필터 지원)
    - cursor: 이전 페이지의 마지막 게시글 ID (id < cursor 조회)
    - limit: 가져올 개수 (기본 10개)
    - category_id: 카테고리 필터
    - search: 검색어
    - search_type: 검색 대상 (all, title, content, author)
    """
    cursor = request.args.get('cursor', type=int)
    limit = min(request.args.get('limit', default=10, type=int), 50)
    category_id = request.args.get('category_id', type=int)
    search = request.args.get('search', default='', type=str).strip()
    search_type = request.args.get('search_type', default='all', type=str).strip().lower()

    query = Post.query

    # 1. 카테고리 필터링
    if category_id:
        query = query.filter(Post.category_id == category_id)

    # 2. 검색어 필터링
    if search:
        if search_type == 'title':
            query = query.filter(Post.title.ilike(f'%{search}%'))
        elif search_type == 'content':
            query = query.filter(Post.content.ilike(f'%{search}%'))
        elif search_type == 'author':
            query = query.join(User).filter(User.username.ilike(f'%{search}%'))
        else:  # all (제목, 내용, 작성자 통합 검색)
            query = query.outerjoin(User).filter(
                or_(
                    Post.title.ilike(f'%{search}%'),
                    Post.content.ilike(f'%{search}%'),
                    User.username.ilike(f'%{search}%')
                )
            )

    # 3. 커서 기반 페이징 (최신순: id < cursor)
    if cursor is not None and cursor > 0:
        query = query.filter(Post.id < cursor)

    # limit + 1 개를 조회하여 다음 페이지 존재 여부(has_more) 판별
    posts = query.order_by(Post.id.desc()).limit(limit + 1).all()

    has_more = len(posts) > limit
    results = posts[:limit]
    next_cursor = results[-1].id if has_more and results else None

    return jsonify({
        'posts': [p.to_dict(include_content=False) for p in results],
        'next_cursor': next_cursor,
        'has_more': has_more,
        'limit': limit,
        'count': len(results)
    }), 200


@posts_bp.route('/posts/<int:post_id>', methods=['GET'])
def get_post(post_id):
    post = Post.query.get(post_id)
    if not post:
        return jsonify({'error': '게시글을 찾을 수 없습니다.'}), 404

    # 조회수 증가
    post.view_count = (post.view_count or 0) + 1
    db.session.commit()

    return jsonify({'post': post.to_dict(include_content=True)}), 200


@posts_bp.route('/posts', methods=['POST'])
@jwt_required()
def create_post():
    user_id = int(get_jwt_identity())
    data = request.get_json() or {}

    title = data.get('title', '').strip()
    content = data.get('content', '').strip()
    category_id = data.get('category_id')

    if not title:
        return jsonify({'error': '제목을 입력해주세요.'}), 400
    if not content:
        return jsonify({'error': '내용을 입력해주세요.'}), 400

    if category_id:
        category = Category.query.get(category_id)
        if not category:
            category_id = None

    new_post = Post(
        title=title,
        content=content,
        user_id=user_id,
        category_id=category_id
    )

    db.session.add(new_post)
    db.session.commit()

    return jsonify({
        'message': '게시글이 성공적으로 등록되었습니다.',
        'post': new_post.to_dict(include_content=True)
    }), 201


@posts_bp.route('/posts/<int:post_id>', methods=['PUT'])
@jwt_required()
def update_post(post_id):
    user_id = int(get_jwt_identity())
    post = Post.query.get(post_id)

    if not post:
        return jsonify({'error': '게시글을 찾을 수 없습니다.'}), 404

    if post.user_id != user_id:
        return jsonify({'error': '수정 권한이 없습니다. 작성자 본인만 수정할 수 있습니다.'}), 403

    data = request.get_json() or {}
    title = data.get('title', '').strip()
    content = data.get('content', '').strip()
    category_id = data.get('category_id')

    if not title:
        return jsonify({'error': '제목을 입력해주세요.'}), 400
    if not content:
        return jsonify({'error': '내용을 입력해주세요.'}), 400

    if category_id:
        category = Category.query.get(category_id)
        if category:
            post.category_id = category_id

    post.title = title
    post.content = content

    db.session.commit()

    return jsonify({
        'message': '게시글이 수정되었습니다.',
        'post': post.to_dict(include_content=True)
    }), 200


@posts_bp.route('/posts/<int:post_id>', methods=['DELETE'])
@jwt_required()
def delete_post(post_id):
    user_id = int(get_jwt_identity())
    post = Post.query.get(post_id)

    if not post:
        return jsonify({'error': '게시글을 찾을 수 없습니다.'}), 404

    if post.user_id != user_id:
        return jsonify({'error': '삭제 권한이 없습니다. 작성자 본인만 삭제할 수 있습니다.'}), 403

    db.session.delete(post)
    db.session.commit()

    return jsonify({'message': '게시글이 성공적으로 삭제되었습니다.'}), 200
