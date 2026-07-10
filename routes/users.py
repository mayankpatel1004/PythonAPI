from flask import Blueprint, request, jsonify
from middleware import token_required, role_required
from db import db
import bcrypt
from utils.tokens import generate_random_token

users_bp = Blueprint('users', __name__, url_prefix='/api/users')

# GET list (already present)
@users_bp.route('/', methods=['GET'])
@token_required
@role_required([1, 2])
def get_users():
    limit = request.args.get('limit', 20, type=int)
    offset = request.args.get('offset', 0, type=int)
    users = db.execute_query(
        """SELECT user_id, user_firstname, user_lastname, user_email, user_role_id,
                  display_status, created_at, is_developer_account
           FROM users WHERE deleted_status = 'N'
           LIMIT %s OFFSET %s""",
        (limit, offset)
    )
    return jsonify(users), 200

# GET single user
@users_bp.route('/<int:user_id>', methods=['GET'])
@token_required
@role_required([1, 2])
def get_user(user_id):
    user = db.execute_one(
        """SELECT user_id, user_firstname, user_lastname, user_email, user_role_id,
                  display_status, created_at, is_developer_account
           FROM users WHERE user_id = %s AND deleted_status = 'N'""",
        (user_id,)
    )
    if not user:
        return jsonify({'message': 'User not found'}), 404
    return jsonify(user), 200

# CREATE user
@users_bp.route('/', methods=['POST'])
@token_required
@role_required([1, 2])
def create_user():
    data = request.get_json()
    # Required fields
    required = ['user_firstname', 'user_lastname', 'user_email', 'user_password', 'user_role_id']
    if not all(k in data for k in required):
        return jsonify({'message': 'Missing required fields'}), 400

    # Check if email already exists
    existing = db.execute_one(
        "SELECT user_id FROM users WHERE user_email = %s AND deleted_status = 'N'",
        (data['user_email'],)
    )
    if existing:
        return jsonify({'message': 'Email already exists'}), 400

    # Hash password
    hashed = bcrypt.hashpw(data['user_password'].encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

    user_id = db.execute_insert(
        """INSERT INTO users
           (user_firstname, user_lastname, user_email, user_password, user_role_id,
            display_status, created_by, created_by_name, created_by_role,
            created_at, updated_at, site_id, active_status)
           VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, NOW(), NOW(), %s, %s)""",
        (
            data['user_firstname'],
            data['user_lastname'],
            data['user_email'],
            hashed,
            data['user_role_id'],
            data.get('display_status', 'Y'),
            request.user_id,
            '',  # created_by_name could be fetched from session
            request.role_id,
            0,  # site_id default
            'Y'  # active_status
        )
    )
    return jsonify({'id': user_id, 'message': 'User created'}), 201

# UPDATE user
@users_bp.route('/<int:user_id>', methods=['PUT'])
@token_required
@role_required([1, 2])
def update_user(user_id):
    data = request.get_json()
    # Check if user exists
    user = db.execute_one(
        "SELECT user_id FROM users WHERE user_id = %s AND deleted_status = 'N'",
        (user_id,)
    )
    if not user:
        return jsonify({'message': 'User not found'}), 404

    # Allowed fields to update
    allowed_fields = ['user_firstname', 'user_lastname', 'user_email', 'user_role_id',
                      'display_status', 'active_status']
    updates = []
    values = []
    for field in allowed_fields:
        if field in data:
            updates.append(f"{field} = %s")
            values.append(data[field])

    # Handle password separately (if provided)
    if 'user_password' in data and data['user_password']:
        hashed = bcrypt.hashpw(data['user_password'].encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
        updates.append("user_password = %s")
        values.append(hashed)

    if not updates:
        return jsonify({'message': 'No fields to update'}), 400

    values.append(user_id)
    query = f"UPDATE users SET {', '.join(updates)}, updated_at = NOW() WHERE user_id = %s AND deleted_status = 'N'"
    db.execute_query(query, values, commit=True)
    return jsonify({'message': 'User updated'}), 200

# DELETE user (soft delete)
@users_bp.route('/<int:user_id>', methods=['DELETE'])
@token_required
@role_required([1, 2])
def delete_user(user_id):
    # Prevent deleting developer account (user_id=1) or self?
    if user_id == 1:
        return jsonify({'message': 'Cannot delete developer account'}), 403
    if user_id == request.user_id:
        return jsonify({'message': 'Cannot delete your own account'}), 403

    db.execute_query(
        "UPDATE users SET deleted_status = 'Y', deleted_by = %s, deleted_time = NOW() WHERE user_id = %s AND deleted_status = 'N'",
        (request.user_id, user_id),
        commit=True
    )
    return jsonify({'message': 'User deleted'}), 200