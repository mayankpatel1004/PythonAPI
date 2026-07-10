import os
import uuid
from werkzeug.utils import secure_filename
from config import Config

ALLOWED_EXTENSIONS = Config.ALLOWED_EXTENSIONS

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

def save_uploaded_file(file):
    if not file or file.filename == '':
        return None
    if not allowed_file(file.filename):
        raise ValueError(f"File type not allowed. Allowed: {', '.join(ALLOWED_EXTENSIONS)}")

    # Create upload directory if not exists
    os.makedirs(Config.UPLOAD_FOLDER, exist_ok=True)

    # Generate a unique filename to avoid collisions
    original_name = secure_filename(file.filename)
    unique_name = f"{uuid.uuid4().hex}_{original_name}"
    file_path = os.path.join(Config.UPLOAD_FOLDER, unique_name)

    file.save(file_path)
    return unique_name  # store only the filename (or relative path)