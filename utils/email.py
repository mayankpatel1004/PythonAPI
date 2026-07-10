import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from config import Config
import logging
import os

logging.basicConfig(level=logging.ERROR)

def send_reset_email(to_email, reset_code):
    subject = "Password Reset Code"

    # Read the HTML template
    template_path = os.path.join(os.path.dirname(__file__), '..', 'templates', 'email', 'reset_password.html')
    with open(template_path, 'r', encoding='utf-8') as f:
        html_template = f.read()

    # Replace placeholder with actual code
    html_content = html_template.replace('{{ reset_code }}', reset_code)

    # Create a multipart email
    msg = MIMEMultipart('alternative')
    msg['Subject'] = subject
    msg['From'] = Config.MAIL_FROM
    msg['To'] = to_email

    # Plain text fallback
    plain_text = f"""
    Password Reset Request

    Your 6-digit reset code is: {reset_code}

    Enter this code on the reset page to create a new password.

    If you did not request this, please ignore this email.
    """
    part1 = MIMEText(plain_text, 'plain')
    part2 = MIMEText(html_content, 'html')

    msg.attach(part1)
    msg.attach(part2)

    try:
        with smtplib.SMTP(Config.MAIL_SERVER, Config.MAIL_PORT) as server:
            server.starttls()
            server.login(Config.MAIL_USERNAME, Config.MAIL_PASSWORD)
            server.sendmail(Config.MAIL_FROM, [to_email], msg.as_string())
        return True
    except Exception as e:
        logging.error(f"Email sending failed: {e}")
        return False
    

def send_password_changed_email(to_email, user_name=None):
    """
    Send a confirmation email that the password was changed.
    """
    subject = "Your Password Has Been Changed"
    
    # Read HTML template
    template_path = os.path.join(os.path.dirname(__file__), '..', 'templates', 'email', 'password_changed.html')
    with open(template_path, 'r', encoding='utf-8') as f:
        html_template = f.read()
    
    # Replace placeholders
    html_content = html_template.replace('{{ name }}', user_name or '')
    
    # Plain text fallback
    plain_text = f"""
    Password Changed Successfully
    
    Hello{', ' + user_name if user_name else ''},
    
    Your password has been successfully changed.
    
    If you did not perform this action, please contact our support team immediately.
    
    Best regards,
    Your Support Team
    """
    
    # Create multipart message
    msg = MIMEMultipart('alternative')
    msg['Subject'] = subject
    msg['From'] = Config.MAIL_FROM
    msg['To'] = to_email
    
    part1 = MIMEText(plain_text, 'plain')
    part2 = MIMEText(html_content, 'html')
    msg.attach(part1)
    msg.attach(part2)
    
    try:
        with smtplib.SMTP(Config.MAIL_SERVER, Config.MAIL_PORT) as server:
            server.starttls()
            server.login(Config.MAIL_USERNAME, Config.MAIL_PASSWORD)
            server.sendmail(Config.MAIL_FROM, [to_email], msg.as_string())
        return True
    except Exception as e:
        logging.error(f"Password changed email sending failed: {e}")
        return False