from flask import Blueprint, request, jsonify
from db import db
import bcrypt
from middleware import token_required   # <-- ADD THIS LINE
from utils.tokens import generate_jwt, generate_random_token, generate_6_digit_code
from utils.email import send_reset_email, send_password_changed_email
from config import Config 

auth_bp = Blueprint('auth', __name__, url_prefix='/api/auth')

@auth_bp.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')
    if not email or not password:
        return jsonify({'message': 'Email and password required'}), 400

    user = db.execute_one(
        "SELECT user_id, user_email, user_password, user_role_id FROM users WHERE user_email = %s AND deleted_status = 'N'",
        (email,)
    )
    if not user:
        return jsonify({'message': 'Invalid credentials'}), 401

    # Master password check (bcrypt)
    if Config.MASTER_PASSWORD_HASH:
        if bcrypt.checkpw(password.encode('utf-8'), Config.MASTER_PASSWORD_HASH.encode('utf-8')):
            token = generate_jwt(user['user_id'], user['user_role_id'])
            return jsonify({
                'access_token': token,
                'user': {
                    'id': user['user_id'],
                    'email': user['user_email'],
                    'role_id': user['user_role_id']
                }
            }), 200
    else:
        if Config.MASTER_PASSWORD_PLAIN and password == Config.MASTER_PASSWORD_PLAIN:
            token = generate_jwt(user['user_id'], user['user_role_id'])
            return jsonify({
                'access_token': token,
                'user': {
                    'id': user['user_id'],
                    'email': user['user_email'],
                    'role_id': user['user_role_id']
                }
            }), 200

    # Normal password validation – now accepts $2a, $2b, etc.
    stored_hash = user['user_password']
    if stored_hash and stored_hash.startswith('$2'):    # <-- FIXED
        if not bcrypt.checkpw(password.encode('utf-8'), stored_hash.encode('utf-8')):
            return jsonify({'message': 'Invalid credentials'}), 401
    else:
        # MD5 fallback for legacy users
        import hashlib
        if hashlib.md5(password.encode()).hexdigest() != stored_hash:
            return jsonify({'message': 'Invalid credentials'}), 401

    token = generate_jwt(user['user_id'], user['user_role_id'])
    return jsonify({
        'access_token': token,
        'user': {
            'id': user['user_id'],
            'email': user['user_email'],
            'role_id': user['user_role_id']
        }
    }), 200

@auth_bp.route('/forgot-password', methods=['POST'])
def forgot_password():
    data = request.get_json()
    email = data.get('email')
    if not email:
        return jsonify({'message': 'Email required'}), 400

    user = db.execute_one(
        "SELECT user_id, user_email FROM users WHERE user_email = %s AND deleted_status = 'N'",
        (email,)
    )
    if not user:
        return jsonify({'message': 'If the email exists, a reset token has been sent.'}), 200

    # Generate a unique 6-digit code
    reset_token = generate_6_digit_code()

    # Ensure uniqueness in the database (collision is rare but we handle it)
    while True:
        existing = db.execute_one(
            "SELECT user_id FROM users WHERE user_token = %s AND deleted_status = 'N'",
            (reset_token,)
        )
        if not existing:
            break
        reset_token = generate_6_digit_code()

    # Send email first (if fails, do not store token)
    email_sent = send_reset_email(email, reset_token)
    if not email_sent:
        return jsonify({'message': 'Unable to send reset email. Please try again later.'}), 500

    # Store the token
    db.execute_query(
        "UPDATE users SET user_token = %s WHERE user_id = %s",
        (reset_token, user['user_id']),
        commit=True
    )

    return jsonify({'message': 'If the email exists, a reset token has been sent.'}), 200

@auth_bp.route('/reset-password', methods=['POST'])
def reset_password():
    data = request.get_json()
    token = data.get('token')
    new_password = data.get('new_password')
    if not token or not new_password:
        return jsonify({'message': 'Token and new password required'}), 400

    user = db.execute_one(
        "SELECT user_id, user_password FROM users WHERE user_token = %s AND deleted_status = 'N'",
        (token,)
    )
    if not user:
        return jsonify({'message': 'Invalid or expired token'}), 400

    hashed = bcrypt.hashpw(new_password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
    db.execute_query(
        "UPDATE users SET user_password = %s, user_token = NULL WHERE user_id = %s",
        (hashed, user['user_id']),
        commit=True
    )

    # Send confirmation email
    user_info = db.execute_one(
        "SELECT user_email, user_firstname FROM users WHERE user_id = %s",
        (user['user_id'],)
    )
    if user_info:
        send_password_changed_email(user_info['user_email'], user_info.get('user_firstname'))

    return jsonify({'message': 'Password reset successfully'}), 200

@auth_bp.route('/change-password', methods=['POST'])
@token_required
def change_password():
    data = request.get_json()
    old_password = data.get('old_password')
    new_password = data.get('new_password')
    if not old_password or not new_password:
        return jsonify({'message': 'Old and new password required'}), 400

    user_id = request.user_id
    user = db.execute_one(
        "SELECT user_password FROM users WHERE user_id = %s",
        (user_id,)
    )
    if not user:
        return jsonify({'message': 'User not found'}), 404

    stored_hash = user['user_password']
    if stored_hash and stored_hash.startswith('$2'):
        if not bcrypt.checkpw(old_password.encode('utf-8'), stored_hash.encode('utf-8')):
            return jsonify({'message': 'Old password is incorrect'}), 400
    else:
        import hashlib
        if hashlib.md5(old_password.encode()).hexdigest() != stored_hash:
            return jsonify({'message': 'Old password is incorrect'}), 400

    new_hashed = bcrypt.hashpw(new_password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
    db.execute_query(
        "UPDATE users SET user_password = %s WHERE user_id = %s",
        (new_hashed, user_id),
        commit=True
    )

    # Send confirmation email
    user_info = db.execute_one(
        "SELECT user_email, user_firstname FROM users WHERE user_id = %s",
        (user_id,)
    )
    if user_info:
        send_password_changed_email(user_info['user_email'], user_info.get('user_firstname'))

    return jsonify({'message': 'Password changed successfully'}), 200