import os
import logging
from config import Config

def setup_logger():
    """Create a logger that writes to the configured log file."""
    log_dir = os.path.dirname(Config.LOG_FILE)
    if log_dir and not os.path.exists(log_dir):
        os.makedirs(log_dir, exist_ok=True)

    logger = logging.getLogger('sql_logger')
    logger.setLevel(logging.DEBUG)

    # Avoid adding multiple handlers on reloads
    if not logger.handlers:
        file_handler = logging.FileHandler(Config.LOG_FILE, mode='a')
        file_handler.setLevel(logging.DEBUG)
        formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
        file_handler.setFormatter(formatter)
        logger.addHandler(file_handler)

    return logger

# Global logger instance
sql_logger = setup_logger()