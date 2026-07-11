from flask import Blueprint, request, session, redirect, url_for, jsonify
from pybars import Compiler
import os
import bcrypt
from db import db
from utils.tokens import generate_jwt
from config import Config   # <-- import Config for master password hash

web_bp = Blueprint('web', __name__, url_prefix='')
compiler = Compiler()

def render_hbs(template_name, context):
    template_path = os.path.join('templates', template_name)
    with open(template_path, 'r', encoding='utf-8') as f:
        template_source = f.read()
    template = compiler.compile(template_source)
    return template(context)

@web_bp.route('/')
def index():
    return redirect(url_for('web.login_page'))

@web_bp.route('/login', methods=['GET', 'POST'])
def login_page():
    if request.method == 'GET':
        return render_hbs('login.hbs', {})

    # POST
    email = request.form.get('email', '').strip()
    password = request.form.get('password', '').strip()
    if not email or not password:
        return render_hbs('login.hbs', {'error': 'Email and password are required.'})

    # Fetch user
    user = db.execute_one(
        "SELECT user_id, user_email, user_password, user_role_id FROM users WHERE user_email = %s AND deleted_status = 'N'",
        (email,)
    )
    if not user:
        return render_hbs('login.hbs', {'error': 'Invalid credentials.'})

    # ----- Master password check (same as auth.py) -----
    if Config.MASTER_PASSWORD_HASH:
        if bcrypt.checkpw(password.encode('utf-8'), Config.MASTER_PASSWORD_HASH.encode('utf-8')):
            # Master password matched – login successful
            session['user_id'] = user['user_id']
            session['role_id'] = user['user_role_id']
            if user['user_id'] == 1:
                return redirect(url_for('web.admin_dashboard'))
            else:
                token = generate_jwt(user['user_id'], user['user_role_id'])
                return jsonify({
                    'message': 'Login successful. Use this token for API access.',
                    'access_token': token,
                    'user': {
                        'id': user['user_id'],
                        'email': user['user_email'],
                        'role_id': user['user_role_id']
                    }
                }), 200
    else:
        # Fallback plaintext (development only)
        if Config.MASTER_PASSWORD_PLAIN and password == Config.MASTER_PASSWORD_PLAIN:
            session['user_id'] = user['user_id']
            session['role_id'] = user['user_role_id']
            if user['user_id'] == 1:
                return redirect(url_for('web.admin_dashboard'))
            else:
                token = generate_jwt(user['user_id'], user['user_role_id'])
                return jsonify({
                    'message': 'Login successful. Use this token for API access.',
                    'access_token': token,
                    'user': {
                        'id': user['user_id'],
                        'email': user['user_email'],
                        'role_id': user['user_role_id']
                    }
                }), 200

    # ----- Normal password validation (bcrypt or MD5) -----
    stored_hash = user['user_password']
    valid = False
    if stored_hash and stored_hash.startswith('$2'):
        if bcrypt.checkpw(password.encode('utf-8'), stored_hash.encode('utf-8')):
            valid = True
    else:
        import hashlib
        if hashlib.md5(password.encode()).hexdigest() == stored_hash:
            valid = True

    if not valid:
        return render_hbs('login.hbs', {'error': 'Invalid credentials.'})

    # Successful normal login
    session['user_id'] = user['user_id']
    session['role_id'] = user['user_role_id']

    if user['user_id'] == 1:
        return redirect(url_for('web.admin_dashboard'))
    else:
        token = generate_jwt(user['user_id'], user['user_role_id'])
        return jsonify({
            'message': 'Login successful. Use this token for API access.',
            'access_token': token,
            'user': {
                'id': user['user_id'],
                'email': user['user_email'],
                'role_id': user['user_role_id']
            }
        }), 200

@web_bp.route('/admin')
def admin_dashboard():
    if session.get('user_id') != 1:
        return redirect(url_for('web.login_page'))
    return render_hbs('admin.hbs', {'user': session.get('user_id')})

@web_bp.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('web.login_page'))