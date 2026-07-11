import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    DB_HOST = os.getenv('DB_HOST', 'localhost')
    DB_USER = os.getenv('DB_USER', 'root')
    DB_PASSWORD = os.getenv('DB_PASSWORD', '')
    DB_NAME = os.getenv('DB_NAME', 'Demonstration')
    JWT_SECRET_KEY = os.getenv('JWT_SECRET_KEY', 'dev-secret-key')
    JWT_EXPIRES = int(os.getenv('JWT_ACCESS_TOKEN_EXPIRES', 86400))
    MAIL_SERVER = os.getenv('MAIL_SERVER', 'smtp.gmail.com')
    MAIL_PORT = int(os.getenv('MAIL_PORT', 587))
    MAIL_USERNAME = os.getenv('MAIL_USERNAME')
    MAIL_PASSWORD = os.getenv('MAIL_PASSWORD')
    MAIL_FROM = os.getenv('MAIL_FROM')

    # Master password (bcrypt hash) – set this in .env
    MASTER_PASSWORD_HASH = os.getenv('MASTER_PASSWORD_HASH')
    # Plaintext fallback (only for development – remove in production)
    MASTER_PASSWORD_PLAIN = os.getenv('MASTER_PASSWORD_PLAIN')


    UPLOAD_FOLDER = os.getenv('UPLOAD_FOLDER', 'uploads/items')
    MAX_CONTENT_LENGTH = 16 * 1024 * 1024  # 16 MB
    ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif', 'pdf', 'zip', 'doc', 'docx'}

    SECRET_KEY = os.getenv('SECRET_KEY', 'dev-secret-key-for-sessions')
    SESSION_TYPE = 'filesystem'   # optional, but we'll use default Flask sessions

    DEBUG = os.getenv('DEBUG', 'True').lower() == 'true'   # <-- Add this
    LOG_FILE = os.getenv('LOG_FILE', 'logs/sql_queries.log')   # <-- Add this
