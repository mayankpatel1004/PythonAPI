import jwt
import secrets
import random
from datetime import datetime, timedelta
from config import Config

def generate_jwt(user_id, role_id):
    payload = {
        'user_id': user_id,
        'role_id': role_id,
        'exp': datetime.utcnow() + timedelta(seconds=Config.JWT_EXPIRES)
    }
    return jwt.encode(payload, Config.JWT_SECRET_KEY, algorithm='HS256')

def decode_jwt(token):
    try:
        payload = jwt.decode(token, Config.JWT_SECRET_KEY, algorithms=['HS256'])
        return payload
    except jwt.PyJWTError:
        return None

def generate_random_token(length=32):
    return secrets.token_urlsafe(length)

def generate_6_digit_code():
    """Generate a random 6-digit numeric code (100000-999999)."""
    return f"{random.randint(100000, 999999)}"