from flask import Blueprint, request, jsonify
from middleware import token_required, role_required
from db import db

users_bp = Blueprint('users', __name__, url_prefix='/api/users')

@users_bp.route('/', methods=['GET'])
@token_required
@role_required([1, 2])  # Developer or Super Admin
def get_users():
    # Pagination optional
    limit = request.args.get('limit', 20, type=int)
    offset = request.args.get('offset', 0, type=int)
    users = db.execute_query(
        "SELECT user_id, user_firstname, user_lastname, user_email, user_role_id, "
        "display_status, created_at FROM users WHERE deleted_status = 'N' "
        "LIMIT %s OFFSET %s",
        (limit, offset)
    )
    return jsonify(users), 200